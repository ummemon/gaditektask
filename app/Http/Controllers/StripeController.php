<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Stripe;
use App\Models\Orders;
use App\Models\Order_products;
use Illuminate\Support\Facades\Auth;
use Session;

class StripeController extends Controller
{
    //
    public function stripe()
    {
        $cart = session()->get('cart');
        if(empty($cart)){
        return redirect('products');
        }
        return view('stripe',['cart'=>$cart]);
    }
    public function payStripe(Request $request)
    {
     
        $this->validate($request, [
            'card_no' => 'required',
            'expiry_month' => 'required',
            'expiry_year' => 'required',
            'cvv' => 'required',
        ]);
 
        $stripe = Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        try {
            $cart = session()->get('cart');
            $totalamount=0;
            if(!empty($cart)){  
            foreach($cart as $cartdata) 
            {
             $totalamount=$totalamount+$cartdata['price']* $cartdata['quantity'];
             } 
           } 
            $response = \Stripe\Token::create(array(
                "card" => array(
                    "number"    => $request->input('card_no'),
                    "exp_month" => $request->input('expiry_month'),
                    "exp_year"  => $request->input('expiry_year'),
                    "cvc"       => $request->input('cvv')
                )));
            if (!isset($response['id'])) {
                return redirect()->route('paynow');
            }
            $charge = \Stripe\Charge::create([
                'card' => $response['id'],
                'currency' => 'USD',
                'amount' =>  100 * $totalamount,
                'description' => 'wallet',
            ]);
 
            if($charge['status'] == 'succeeded') {
               
                $orders=new Orders();
                $orders->user_id=Auth::user()->id;
                $orders->amount=$totalamount;
                $orders->charge_id=$charge['id'];
                $orders->save();
             
                for($i=1;$i<=count($cart);$i++)
                {
                 
                   $ordersProducts=new Order_products();
                   $ordersProducts->order_id=$orders->id;
                   $ordersProducts->product_id=$i;
                   $ordersProducts->save();
               
                   
                }
                 $cart=session()->forget('cart');
                 $details = [

                    'title' => 'Thank you for order',
            
                    'body' => ''
            
                ];
            
               
            
                \Mail::to(Auth::user()->email)->send(new \App\Mail\SendMail($details));
               
                return redirect('products')->with('success', 'Payment Success!');
                 
 
            } else {
                return redirect('stripe')->with('error', 'something went to wrong.');
            }
 
        }
        catch (Exception $e) {
            return $e->getMessage();
        }
 
    }
}

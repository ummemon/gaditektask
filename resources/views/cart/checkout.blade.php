@extends('layouts.master')
@section('title', 'Cart')
@section('content')
    <table id="cart" class="table table-hover table-condensed">
        <thead>
        <tr>
            <th style="width:50%">Product</th>
            <th style="width:10%">Price</th>
            <th style="width:8%">Quantity</th>
            <th style="width:22%" class="text-center">Subtotal</th>
            <th style="width:10%"></th>
        </tr>
        </thead>
        <tbody>
         <?php $totalamount=0;?>  
         @foreach($cart as $cartdata) 
         <?php $totalamount=$totalamount+$cartdata['price']* $cartdata['quantity'];?>
        <tr>
            <td data-th="Product">
                <div class="row">
                        <h4 class="nomargin">{{ $cartdata['name'] }}</h4>
                </div>
            </td>
            <td data-th="Price">${{ $cartdata['price'] }}</td>
            <td data-th="Quantity">
            {{ $cartdata['quantity']  }}
            </td>    

            <!-- <td data-th="Quantity">
                <input type="number" class="form-control text-center" value="1">
            </td> -->
            <td data-th="Subtotal" class="text-center">{{ $cartdata['price']* $cartdata['quantity'] }}</td>
            <!-- <td class="actions" data-th="">
                <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
            </td> -->
        </tr>
        @endforeach
        </tbody>
        <tfoot>
        <tr class="visible-xs">
            <td class="text-center"><strong>Total {{ $totalamount  }}</strong></td>
        </tr>
        <tr>
            <td>
                <a href="{{ url('/products') }}" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a>
                <a href="{{ url('/products') }}" class="btn btn-warning"><i class="fa fa-angle-left"></i>Checkout</a>
           </td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center"><strong>Total ${{ $totalamount  }}</strong></td>
        </tr>
        </tfoot>
    </table>
    @endsection

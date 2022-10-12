<?php

namespace App\Http\Controllers;

use App\Models\cr;
use Illuminate\Http\Request;
use App\Models\Mailbox;
use App\Models\User;
use Auth;


class MailboxController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      //  $imboxdata= User::with('sent')->get();
       
        $inboxdata= Mailbox::whereHas('receiver', function ($query) {
            $query->where('sender_to_id', Auth::user()->id);
        })->get();
        $sentdata= Mailbox::whereHas('sender', function ($query) {
            $query->where('sender_id', Auth::user()->id);
        })->get();
        return view('mailbox.index',['inboxdata'=>$inboxdata,'sentdata'=>$sentdata]);
    }

    public function sentlist()
    {
        $inboxdata= Mailbox::whereHas('receiver', function ($query) {
            $query->where('sender_to_id', Auth::user()->id);
        })->get();
        $sentdata= Mailbox::whereHas('sender', function ($query) {
            $query->where('sender_id', Auth::user()->id);
        })->get();
     
       return view('mailbox.sent',['inboxdata'=>$inboxdata,'sentdata'=>$sentdata]);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      $users=User::with('sent')->where('id',"!=",Auth::user()->id)->get();
      return view('mailbox.create',['users'=>$users]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
          $this->validate($request, [
            'sender_to_id' => 'required',
            'subject' => 'required',
            'message' => 'required',
         ]);
         try {
        Auth::user()->sendMessageTo($request->sender_to_id, $request->subject, $request->message);
        return redirect('inbox')->with('success', 'Message Sent!');
         }
        catch (Exception $e) {
            return $e->getMessage();
        }  
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\cr  $cr
     * @return \Illuminate\Http\Response
     */
    public function show(cr $cr)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\cr  $cr
     * @return \Illuminate\Http\Response
     */
    public function edit(cr $cr)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\cr  $cr
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, cr $cr)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\cr  $cr
     * @return \Illuminate\Http\Response
     */
    public function destroy(cr $cr)
    {
        //
    }
}

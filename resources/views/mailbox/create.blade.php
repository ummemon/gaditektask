@extends('layouts.master')

@section('content')
<div class="d-flex justify-content-between mb-4">
        <h3>Create</h3>
    </div>
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
 
    @if(session()->has('error'))
        <div class="alert alert-danger">
            {{ session()->get('error') }}
        </div>
    @endif
 
    @if(session()->has('success'))
        <div class="alert alert-success">
            {{ session()->get('success') }}
        </div>
    @endif
<form action="{{ route('mail.store') }}" method="POST">
    @csrf
    <div class="form-group">
        <label>Name</label>
        <!-- <input type="text" name="name" class="form-control" value="" > -->
        <select class="form-group" name="sender_to_id">
        @if(!empty($users))    
        @foreach($users as $userdata)    
        <option value="{{ $userdata->id }}">{{ $userdata->name }}</option>
        @endforeach
        @endif
        </select>

    </div>
       <div class="form-group">
        <label>Subject</label>
        <input type="text" name="subject" class="form-control" value="" >
    </div>
    <div class="form-group">
        <label>Message</label>
        <textarea name="message" rows="5" placeholder="Enter Message" class="form-control" ></textarea>
    </div>
    <div class="form-group">
    <button type="submit" class="btn btn-success btn-sm" >Sent</button>
     <div>
    
</form>
@endsection
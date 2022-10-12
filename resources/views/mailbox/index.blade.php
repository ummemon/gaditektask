@extends('layouts.master')

@section('content')
<div class="d-flex justify-content-between mb-4">
        <h3>Inbox</h3>
        <a class="btn btn-success btn-sm" href="{{ route('mail.create') }}">Create</a>
        <a class="btn btn-success btn-sm" href="{{ route('mail.indox') }}">Inbox({{ count($inboxdata) }})</a>
        <a class="btn btn-success btn-sm" href="{{ route('mail.sent') }}">Sent ({{ count($sentdata) }})</a>
</div>

    @if(session()->has('success'))
        <label class="alert alert-success w-100">{{session('success')}}</label>
    @elseif(session()->has('error'))
        <label class="alert alert-danger w-100">{{session('error')}}</label>
    @endif

    <table class="table table-striped">
        <thead>
        <tr>
           
            <th>#</th>
            <th>Subject</th>
            <th>Message</th>
        </tr>
        </thead>
        <tbody>
      @if(!empty($inboxdata))
      @php $i=1; @endphp
      @foreach($inboxdata as $data)
        <tr>
        <td>
      {{ $i }}
       </td>
       <td>
      {{ $data->subject }}
       </td>
       <td>
      {{ $data->message }}
       </td>
       </tr>
     @php $i++; @endphp

      @endforeach
      
      @endif
      
        </tbody>
    </table>
@endsection
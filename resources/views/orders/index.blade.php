@extends('layouts.master')

@section('content')
<table class="table table-striped">
        <thead>
        <tr>
           
            <th>Order#</th>
            <th>Price</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        @foreach($orders as $ordersData)
            <tr>
                <td>{{ $ordersData->id }}</td>
                <td>{{ $ordersData->amount }}</td>
                <td>
                @if($ordersData->status==1)
                Pending
                @else
                Deliver
                @endif        
                
            
            </td>
               
            </tr>
        @endforeach
        </tbody>
    </table>
@endsection
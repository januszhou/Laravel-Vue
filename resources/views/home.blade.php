@extends('layouts.app')
@section('content')
<div class="col-md-12">
    @if (Auth::check())
        {{-- Questions --}}
        Questions
    @else
        <button class="btn btn-success btn-lg center-block">Get Start</button>
    @endif
</div>
@endsection
@section('script')
<script>
    $(function(){

    })
</script>
@endsection

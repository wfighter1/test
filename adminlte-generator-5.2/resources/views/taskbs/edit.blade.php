@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Taskb
        </h1>
   </section>
   <div class="content">
       @include('adminlte-templates::common.errors')
       <div class="box box-primary">
           <div class="box-body">
               <div class="row">
                   {!! Form::model($taskb, ['route' => ['taskbs.update', $taskb->id], 'method' => 'patch']) !!}

                        @include('taskbs.fields')

                   {!! Form::close() !!}
               </div>
           </div>
       </div>
   </div>
@endsection
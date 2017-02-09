<table class="table table-responsive" id="taskbs-table">
    <thead>
        
        <th colspan="3">Action</th>
    </thead>
    <tbody>
    @foreach($taskbs as $taskb)
        <tr>
            
            <td>
                {!! Form::open(['route' => ['taskbs.destroy', $taskb->id], 'method' => 'delete']) !!}
                <div class='btn-group'>
                    <a href="{!! route('taskbs.show', [$taskb->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                    <a href="{!! route('taskbs.edit', [$taskb->id]) !!}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                    {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                </div>
                {!! Form::close() !!}
            </td>
        </tr>
    @endforeach
    </tbody>
</table>
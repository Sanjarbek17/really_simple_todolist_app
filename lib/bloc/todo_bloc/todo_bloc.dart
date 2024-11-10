import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:really_simple_todolist_app/models/todo_model.dart';

part 'todo_state.dart';
part 'todo_event.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState>{
  TodoBloc() : super(const TodoState()){
    on<FetchTodo>(_onFetchTodo);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }
  
  void _onFetchTodo(FetchTodo event, Emitter<TodoState> emit){}

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit){}

  void _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit){}

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit){}
}
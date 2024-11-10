import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:really_simple_todolist_app/data/models/todo_model.dart';
import 'package:really_simple_todolist_app/data/repository/todo_repository.dart';

part 'todo_state.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;
  TodoBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(const TodoState()) {
    on<FetchTodo>(_onFetchTodo);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onFetchTodo(FetchTodo event, Emitter<TodoState> emit) {
    emit(state.copyWith(status: TodoStatus.loading));
    emit.forEach(
      _todoRepository.getTodos(),
      onData: (todos) {
        return state.copyWith(todoList: todos, status: TodoStatus.loaded);
      },
      onError: (_, __) {
        return state.copyWith(status: TodoStatus.error);
      },
    );
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    _todoRepository.add(event.todo);
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) {
    _todoRepository.update(event.todo);
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    _todoRepository.delete(event.todo);
  }
}

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
    on<GetTodo>(_onGetTodo);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  Future<void> _onGetTodo(GetTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodoStatus.loading));
    await emit.forEach<List<ToDoModel>>(
      _todoRepository.getTodos(),
      onData: (todos) {
        return state.copyWith(
          todoList: todos,
          status: TodoStatus.loaded,
        );
      },
      onError: (_, __) {
        return state.copyWith(status: TodoStatus.error);
      },
    );
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    _todoRepository.add(event.todo);
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    emit(state.copyWith(status: TodoStatus.loading));
    _todoRepository.update(event.todo, event.oldTodo);
  }

  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    _todoRepository.delete(event.todo);
  }
}

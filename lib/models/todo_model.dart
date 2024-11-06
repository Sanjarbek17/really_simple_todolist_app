import 'package:equatable/equatable.dart';
import 'package:really_simple_todolist_app/models/category_model.dart';

class ToDoModel extends Equatable {
  final String title;
  final String description;
  final CategoryModel category;
  final DateTime date;
  final int priority;
  final bool isCompleted;

  const ToDoModel({
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.priority,
    required this.isCompleted,
  });

  ToDoModel copyWith({
    String? title,
    String? description,
    CategoryModel? category,
    DateTime? date,
    int? priority,
    bool? isCompleted,
  }) {
    return ToDoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      date: date ?? this.date,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }


  @override
  String toString() {
    return 'ToDoModel(title: $title, description: $description, category: $category, date: $date, priority: $priority, isCompleted: $isCompleted)';
  }
  
  @override
  List<Object?> get props => [title, description];
}

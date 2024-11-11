import 'package:equatable/equatable.dart';
import 'package:really_simple_todolist_app/core/utils/data_list.dart';
import 'package:really_simple_todolist_app/data/models/category_model.dart';

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
    int? categoryId,
    DateTime? date,
    int? priority,
    bool? isCompleted,
  }) {
    return ToDoModel(
      title: title ?? this.title,
      description: description ?? this.description,
      category: categoryId != null
          ? categoryList
              .where(
                (element) => element.id == categoryId,
              )
              .first
          : category,
      date: date ?? this.date,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category.id,
      'date': date.millisecondsSinceEpoch,
      'priority': priority,
      'isCompleted': isCompleted,
    };
  }

  factory ToDoModel.fromJson(Map<String, dynamic> map) {
    return ToDoModel(
      title: map['title'],
      description: map['description'],
      category: categoryList.firstWhere((element) => element.id == map['category']),
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      priority: map['priority'],
      isCompleted: map['isCompleted'],
    );
  }

  @override
  String toString() {
    return 'ToDoModel(title: $title, description: $description, category: $category, date: $date, priority: $priority, isCompleted: $isCompleted)';
  }

  @override
  List<Object?> get props => [title, description];
}

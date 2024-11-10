import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/models/category_model.dart';
import 'package:really_simple_todolist_app/models/todo_model.dart';

List<CategoryModel> categoryList = [
  const CategoryModel(id: 1, name: 'Work', icon: Icons.work, color: 0xFFE57373),
  const CategoryModel(id: 2, name: 'Personal', icon: Icons.person, color: 0xFF81C784),
  const CategoryModel(id: 3, name: 'Meeting', icon: Icons.meeting_room, color: 0xFF64B5F6),
  const CategoryModel(id: 4, name: 'Shopping', icon: Icons.shopping_cart, color: 0xFFBA68C8),
  const CategoryModel(id: 5, name: 'Party', icon: Icons.party_mode, color: 0xFFF06292),
  const CategoryModel(id: 6, name: 'Study', icon: Icons.school, color: 0xFF4DB6AC),
  const CategoryModel(id: 7, name: 'Sport', icon: Icons.sports_soccer, color: 0xFF81D4FA),
  const CategoryModel(id: 8, name: 'Travel', icon: Icons.airplanemode_active, color: 0xFF64B5F6),
  const CategoryModel(id: 9, name: 'Health', icon: Icons.local_hospital, color: 0xFF4DB6AC),
  const CategoryModel(id: 10, name: 'Other', icon: Icons.category, color: 0xFFE57373),
];

List<ToDoModel> todoList = [
  ToDoModel(
    title: 'Do Math Homework',
    description: 'Do the math homework that is given by the teacher.',
    category: categoryList[5],
    date: DateTime.now(),
    priority: 1,
    isCompleted: false,
  ),
  ToDoModel(
    title: 'Go to the gym',
    description: 'Go to the gym and do the exercises.',
    category: categoryList[6],
    date: DateTime.now(),
    priority: 2,
    isCompleted: false,
  ),
  ToDoModel(
    title: 'Buy a gift for my friend',
    description: 'Buy a gift for my friend\'s birthday.',
    category: categoryList[3],
    date: DateTime.now(),
    priority: 3,
    isCompleted: false,
  ),
];

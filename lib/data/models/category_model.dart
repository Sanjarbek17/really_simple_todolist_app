import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final IconData? icon;
  final String? iconPath;
  final int color;

  const CategoryModel({
    required this.id,
    required this.name,
    this.icon,
    this.iconPath,
    required this.color,
  });

  @override
  List<Object?> get props => [name];
}

import 'dart:convert';

class TodoModel {
  final int id;
  final String title;
  final String description;
  final String time;
  final int favorite;
  final int complete;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.favorite,
    required this.complete,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      time: json['time'],
      favorite: json['favorite'],
      complete: json['complete'],
    );
  }
}

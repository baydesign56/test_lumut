// To parse this JSON data, do
//
//     final modelTodos = modelTodosFromJson(jsonString);

import 'dart:convert';

List<ModelTodos> modelTodosFromJson(String str) =>
    List<ModelTodos>.from(json.decode(str).map((x) => ModelTodos.fromJson(x)));

String modelTodosToJson(List<ModelTodos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelTodos {
  ModelTodos({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory ModelTodos.fromJson(Map<String, dynamic> json) => ModelTodos(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}

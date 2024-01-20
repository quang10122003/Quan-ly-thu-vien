import 'package:flutter/material.dart';

class Student {
  int id;
  String name;
  Student({
    required this.id,
    required this.name,
  });
}

class StudentManager with ChangeNotifier {
  List<Student> students = [
    Student(id: 21012878, name: "Khanh"),
    Student(id: 21011616, name: "Nam"),
    Student(id: 1, name: "John"),
    Student(id: 2, name: "Joe"),
    Student(id: 3, name: "Graham"),
  ];
}
import 'package:flutter/material.dart';
import 'package:happy_testing/app/app.dart';
import 'package:repository/repository.dart';

void main() {
  final repository = Repository.create();
  runApp(HappyTestingApp(repository));
}

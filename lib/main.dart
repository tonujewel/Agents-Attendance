import 'package:flutter/material.dart';
import 'app/util/dependency.dart';
import 'presentation/app.dart';

void main() {
  DependencyCreator.init();
  runApp(const App());
}


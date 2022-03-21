import 'package:flutter/material.dart';
import 'package:untitled/Injection.dart' as di;
import 'package:untitled/presentation/apps/MainApp.dart';

void main() async {
  await di.init();
  runApp(const MainApp());
}


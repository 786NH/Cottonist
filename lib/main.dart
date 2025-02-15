import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listview/view/dashboard/director_dashboard.dart';
import 'package:listview/view/login.dart';
import 'package:listview/view/showMatrixPage.dart';
import 'package:listview/view/signup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cottonist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home : DirectorDashboard(),
    );
  }
}


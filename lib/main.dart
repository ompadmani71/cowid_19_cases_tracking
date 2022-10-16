import 'package:corona_cases_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColor: const Color(0xff937DA8),
      ),
      home: const HomePage(),
    ),
  );
}

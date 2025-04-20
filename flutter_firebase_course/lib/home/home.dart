import 'package:flutter/material.dart';
import 'package:flutter_firebase_course/login/login.dart';
import 'package:flutter_firebase_course/services/auth.dart';
import 'package:flutter_firebase_course/shared/bottom_nav.dart';
import 'package:flutter_firebase_course/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading...");
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          } else if (snapshot.hasData) {
            return const TopicsScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}

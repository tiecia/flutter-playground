import 'package:flutter_firebase_course/about/about.dart';
import 'package:flutter_firebase_course/home/home.dart';
import 'package:flutter_firebase_course/profile/profile.dart';
import 'package:flutter_firebase_course/login/login.dart';
import 'package:flutter_firebase_course/topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};

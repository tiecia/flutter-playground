import 'package:flutter/material.dart';
import 'package:flutter_firebase_course/shared/bottom_nav.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topics"),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

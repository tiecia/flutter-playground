import 'package:flutter/material.dart';
import 'package:flutter_firebase_course/services/models.dart';
import 'package:flutter_firebase_course/topics/drawer.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key, required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Hero(
            tag: topic.img,
            child: Image.asset("assets/covers/${topic.img}"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Text(
              topic.title,
              style: const TextStyle(
                height: 2,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: QuizList(topic: topic),
          )
        ],
      ),
    );
  }
}

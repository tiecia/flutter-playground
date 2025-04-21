import 'package:flutter/material.dart';
import 'package:flutter_firebase_course/services/firestore.dart';
import 'package:flutter_firebase_course/shared/bottom_nav.dart';
import 'package:flutter_firebase_course/services/models.dart';
import 'package:flutter_firebase_course/shared/error.dart';
import 'package:flutter_firebase_course/shared/loading.dart';
import 'package:flutter_firebase_course/topics/drawer.dart';
import 'package:flutter_firebase_course/topics/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return ErrorScreen(
                message: "An error has occured: ${snapshot.error.toString()}");
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: Text("Topics"),
              ),
              drawer: TopicDrawer(topics: topics),
              body: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                children:
                    topics.map((topic) => TopicItem(topic: topic)).toList(),
              ),
              bottomNavigationBar: BottomNavBar(),
            );
          } else {
            return Text("No topics found in Firestore. Check database.");
          }
        });
  }
}

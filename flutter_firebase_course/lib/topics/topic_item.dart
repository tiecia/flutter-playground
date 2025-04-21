import 'package:flutter/material.dart';
import 'package:flutter_firebase_course/services/models.dart';
import 'package:flutter_firebase_course/shared/progress_bar.dart';
import 'package:flutter_firebase_course/topics/drawer.dart';
import 'package:flutter_firebase_course/topics/topic_screen.dart';
import 'package:flutter_firebase_course/topics/topics.dart';

class TopicItem extends StatelessWidget {
  const TopicItem({super.key, required this.topic});
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: topic.img,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext builder) => TopicScreen(topic: topic),
              ),
            );
          },
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Image.asset(
                    'assets/covers/${topic.img}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    topic.title,
                    style: const TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ),
              Flexible(
                child: TopicProgress(
                  topic: topic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_firebase_course/services/auth.dart';
import 'package:flutter_firebase_course/services/models.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;
    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(user.email ?? "Guest"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200,
                child: Image.asset("assets/user.png"),
              ),
              Column(
                children: [
                  Text(
                    report.total.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                  Text("Quizzes Completed")
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/", (route) => false);
                },
                child: Text("Sign Out"),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text("User is not signed in."),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_course/routes.dart';
import 'package:flutter_firebase_course/services/firestore.dart';
import 'package:flutter_firebase_course/services/models.dart';
import 'package:flutter_firebase_course/theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`main
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text(
              'error: ${snapshot.error.toString()}',
              textDirection: TextDirection.ltr,
            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider(
              create: (_) => FirestoreService().streamReport(),
              initialData: Report(),
              child: MaterialApp(
                routes: appRoutes,
                theme: appTheme,
              ),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Text('loading', textDirection: TextDirection.ltr,);
        },
      ),
    );
  }
}

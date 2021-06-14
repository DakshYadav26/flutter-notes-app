import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_app/viewnotes.dart';

import 'auth.dart';
import 'addnote.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Unable to initialize Firebase');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Notes App',
              debugShowCheckedModeBanner: false,
              routes: {
                Auth.id: (context) => Auth(),
                Addnote.id: (context) => Addnote(),
                ViewNotes.id: (context) => ViewNotes(),
              },
              initialRoute: Auth.id,
            );
          }

          return CircularProgressIndicator();
        });
  }
}

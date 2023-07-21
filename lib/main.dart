import 'package:bloodapplication/project/add.dart';
import 'package:bloodapplication/project/home.dart';
import 'package:bloodapplication/project/update.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home:  MyHomePage(),
      routes: {
        '/':(context) => HomePage(),
        '/add':(context) => AddUser(),
        '/update':(context) => UpdateUser(),
      },
      initialRoute: '/',
    );
  }
}

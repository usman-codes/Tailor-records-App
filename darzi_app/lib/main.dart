import 'package:darzi_app/Controller/internetcontroller.dart';
import 'package:darzi_app/screens/Splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAw9dDMnwBo6DAUl-1YB0YYTWDIBlkJWZk",
          appId: "1:995464969159:android:e9c12f4efa81036c77b7e2",
          messagingSenderId: "995464969159",
          projectId: "digital-darzi-3c619"));
  runApp(const MyApp());
  Get.put(InternetController(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DARZI DIGITAL',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const splashscreen());
  }
}

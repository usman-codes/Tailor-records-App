import 'package:darzi_app/Controller/internetcontroller.dart';
import 'package:darzi_app/provider/theme_provider.dart';
// Fix the import statement
import 'package:darzi_app/screens/Splashscreen.dart';
import 'package:darzi_app/widgets/custom%20widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAw9dDMnwBo6DAUl-1YB0YYTWDIBlkJWZk",
          appId: "1:995464969159:android:e9c12f4efa81036c77b7e2",
          messagingSenderId: "995464969159",
          projectId: "digital-darzi-3c619"));
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
    child: MyApp(),
  )); // Use MyApp as the main widget
  Get.put(InternetController(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DARZI DIGITAL',
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.amber,
              useMaterial3: true,
              appBarTheme: AppBarTheme(color: Colors.black),
              iconTheme: IconThemeData(color: Colors.white),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.black)),
          darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(color: Colors.red),
              iconTheme: IconThemeData(color: Colors.red),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.white)),

          home: const splashscreen(), // Set SplashScreen as the initial screen
        );
      },
    );
  }
}

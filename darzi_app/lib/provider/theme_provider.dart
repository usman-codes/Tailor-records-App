import 'package:darzi_app/widgets/custom%20widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  late SharedPreferences storage;

  //Custom dark theme
  final darkTheme = ThemeData(
    primaryColor: Colors.black12,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black12,
    appBarTheme: const AppBarTheme(backgroundColor: Appcolors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Appcolors.black,
      unselectedItemColor: Colors.white,
    ),
  );

  //Custom light theme
  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Appcolors.black,
      unselectedItemColor: Colors.black54,
    ),
  );

  //Now we want to save the last changed theme value

  //Dark mode toggle action
  changeTheme() {
    _isDark = !isDark;

    //Save the value to secure storage
    storage.setBool("isDark", _isDark);
    notifyListeners();
  }

  //Init method of provider
  init() async {
    //After we re run the app
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}

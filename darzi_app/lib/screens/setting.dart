import 'package:darzi_app/Firebase/auth_service.dart';
import 'package:darzi_app/screens/loginscreen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Settings Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _logout(context);
        },
        child: Icon(Icons.logout),
      ),
    );
  }

  void _logout(BuildContext context) async {
    String? result = await _authService.logout();
    if (result == 'Success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginscreen()),
      ); // Navigate to login screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error"),
        ),
      );
    }
  }
}

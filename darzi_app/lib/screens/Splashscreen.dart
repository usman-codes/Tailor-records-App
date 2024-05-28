import 'package:flutter/material.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Icon.png",
                width: 200,
                height: 300,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DARZI",
                    style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 63, 20, 163),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Khata",
                    style: TextStyle(fontSize: 50),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

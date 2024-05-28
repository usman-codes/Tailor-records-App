import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/Icon.svg",
                    width: 100,
                    height: 300,
                  ))
            ],
          ),
        ));
  }
}

import 'package:darzi_app/screens/Homescreen.dart';
import 'package:darzi_app/screens/Signupscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();

  bool ishidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.deepPurple, Colors.purple]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 25, top: 60),
              child: Text(
                "Hello\nSign In !",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 350),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: loginEmail,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.email_outlined),
                            label: const Text(
                              "Email",
                              style: TextStyle(color: Colors.deepPurple),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: loginpassword,
                        obscureText: ishidden,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    ishidden = !ishidden;
                                  });
                                },
                                child: Icon(ishidden
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            label: Text(
                              "Password",
                              style: TextStyle(color: Colors.deepPurple),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        },
                        child: Container(
                          height: 60,
                          width: 250,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [Colors.deepPurple, Colors.purple]),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                              child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Don't have an account?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signupscrenn()));
                              },
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:darzi_app/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class signupscrenn extends StatefulWidget {
  const signupscrenn({super.key});

  @override
  State<signupscrenn> createState() => _signupscrennState();
}

class _signupscrennState extends State<signupscrenn> {
  bool ishidden = true;
  TextEditingController signupname = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
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
                "Wellcome\nSign Up !",
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
                        controller: signupname,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.person_2_outlined),
                            label: const Text(
                              "Name",
                              style: TextStyle(color: Colors.deepPurple),
                            )),
                      ),
                      TextField(
                        controller: signupemail,
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
                        controller: signuppassword,
                        obscureText: ishidden,
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
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 250,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [Colors.deepPurple, Colors.purple]),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Center(
                              child: Text(
                            "Sign Up",
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
                              "If you have an account?",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "SIGN IN",
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

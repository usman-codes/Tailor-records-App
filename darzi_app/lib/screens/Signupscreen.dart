import 'package:darzi_app/Firebase/auth_service.dart';
import 'package:darzi_app/screens/Homescreen.dart';
import 'package:darzi_app/screens/loginscreen.dart';
import 'package:darzi_app/widgets/custom%20widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class signupscrenn extends StatefulWidget {
  const signupscrenn({super.key});

  @override
  State<signupscrenn> createState() => _signupscrennState();
}

class _signupscrennState extends State<signupscrenn> {
  TextEditingController signupname = TextEditingController();
  TextEditingController signupemail = TextEditingController();
  TextEditingController signuppassword = TextEditingController();
  ValueNotifier<bool> toggel = ValueNotifier(true);
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: signupname,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: const Icon(
                                Icons.person_2_outlined,
                                color: Colors.deepPurple,
                              ),
                              hintText: "Name"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: signupemail,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.deepPurple,
                              ),
                              hintText: "Email"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ValueListenableBuilder(
                            valueListenable: toggel,
                            builder: (context, Value, child) {
                              return TextField(
                                controller: signuppassword,
                                obscureText: toggel.value,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          toggel.value = !toggel.value;
                                        },
                                        child: Icon(
                                          toggel.value
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.deepPurple,
                                        )),
                                    hintText: "Password"),
                              );
                            }),
                        const SizedBox(
                          height: 50,
                        ),
                        CupertinoButton(
                          onPressed: () async {
                            final message = await AuthService().registration(
                                email: signupemail.text,
                                password: signuppassword.text);
                            if (message!.contains('Success')) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            } else {
                              showFlashMessage(context, message);
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //     content: Text(message),
                              //   ),
                              // );
                            }
                          },
                          padding: EdgeInsets.zero,
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
                          height: 100,
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => loginscreen()));
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
            ),
          )
        ],
      ),
    );
  }
}

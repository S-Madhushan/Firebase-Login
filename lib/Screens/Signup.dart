import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/Screens/Login.dart';
import 'package:lottie/lottie.dart';

import '../Resuable_Widgets/resuable_widgets.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 7, 42),
        elevation: 0,
        title: const Text(
          "Register Here",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: Column(
              children: <Widget>[
                Lottie.asset('assets/register.json'),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(
                    "Enter Name", Icons.person, false, _nameTextController),
                const SizedBox(
                  height: 20,
                ),
                resuableTextField(
                    "Enter Email", Icons.email, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                resuableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInsignUpButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created Account");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }).onError((error, stackTrace) {
                    print("error ${error.toString()}");
                  });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

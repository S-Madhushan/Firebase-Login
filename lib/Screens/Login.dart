import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/Screens/Signup.dart';
import 'package:lottie/lottie.dart';

import '../Resuable_Widgets/resuable_widgets.dart';
import '../Utils/color_utils.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.loginColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(children: <Widget>[
              Lottie.asset('assets/register.json'),
              SizedBox(
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
              signInsignUpButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                      print("Login Success");
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }).onError((error, stackTrace) {
                    print("error ${error.toString()}");
                  });
              }),
              signUpOption()
            ]),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "If you do not have account : ",
          style: GoogleFonts.sanchez(
              fontSize: 15,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUP()));
          },
          child: Text(
            " Register Here",
            style: GoogleFonts.sanchez(
                fontSize: 15,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

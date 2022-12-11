import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Image logoWidget(String imagename) {
  return Image.asset(
    imagename,
    fit: BoxFit.fitWidth,
    width: 300,
    height: 150,
    // color: Color.fromARGB(255, 247, 246, 246),
  );
}

Image shape(String imagename) {
  return Image.asset(imagename,
      fit: BoxFit.fitWidth,
      width: 150,
      height: 150,
      alignment: Alignment.topRight
      //color: Color.fromARGB(255, 247, 246, 246),
      );
}

TextField resuableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Color.fromARGB(255, 22, 21, 21),
    style: TextStyle(color: Color.fromARGB(255, 18, 18, 18).withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Color.fromARGB(255, 4, 0, 248).withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInsignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'Login' : 'Signup',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Color.fromARGB(255, 28, 0, 184);
            }
            return Color.fromARGB(255, 28, 0, 184);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
    ),
  );
}

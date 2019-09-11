import 'package:flutter/material.dart';

class SearchComponent {
  Widget logo() {
    return Container(
      alignment: Alignment.center,
      width: 150,
      height: 150,
      child: Image.asset('assets/img/logo.jpeg'),
    );
  }

  Widget emailField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        border: const OutlineInputBorder(),
        hintText: "E-mail",
        hasFloatingPlaceholder: true,
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.enhanced_encryption),
        border: const OutlineInputBorder(),
        hintText: "Password",
      ),
      obscureText: true,
    );
  }

  Widget buttonAction(
      {bool isLoading = false,
      double width = 350,
      double height = 50,
      double radius = 8,
      String text = "Ação",
      Function onTap}) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.blue,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: isLoading
              ? _circularLoading()
              : Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
        ),
      ),
    );
  }

  Widget _circularLoading() {
    return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white));
  }
}

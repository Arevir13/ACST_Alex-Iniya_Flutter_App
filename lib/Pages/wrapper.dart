import 'package:flutter/material.dart';
import 'package:practice_app/Pages/home%20and%20authentication%20screens/authenticate.dart';
import 'package:practice_app/Pages/homeScreen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate widget/page
    return Authenticate();
  }
}

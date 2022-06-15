import 'package:flutter/material.dart';

class Backgraund extends StatelessWidget {
  const Backgraund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.6,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.centerLeft,
              colors: [
                Color(0xff201E28),
                Color(0xff33333E),
              ])),
    );
  }
}

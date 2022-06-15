import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const FaIcon(FontAwesomeIcons.chevronLeft),
          const Spacer(),
          Row(
            children: const [
              FaIcon(FontAwesomeIcons.message),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.headphonesSimple),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.upRightFromSquare)
            ],
          ),
        ],
      ),
    );
  }
}

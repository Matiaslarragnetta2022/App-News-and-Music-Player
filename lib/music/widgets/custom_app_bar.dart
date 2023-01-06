import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: const [
          Icon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.grey,
          ),
          Spacer(),
          Icon(
            FontAwesomeIcons.comment,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            FontAwesomeIcons.headphones,
            color: Colors.grey,
          ),
        ],
      ),
    ));
  }
}

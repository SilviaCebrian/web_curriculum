import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String title;
  final int position;
  const CustomTab({Key? key, required this.title, required this.position}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(title,
          style: const TextStyle(
              fontFamily: 'Boogaloo',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold)),
    );
  }
}

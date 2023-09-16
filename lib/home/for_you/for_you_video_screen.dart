import 'package:flutter/material.dart';

class ForYouVideoScreen extends StatefulWidget {
  const ForYouVideoScreen({super.key});

  @override
  State<ForYouVideoScreen> createState() => _ForYouVideoScreenState();
}

class _ForYouVideoScreenState extends State<ForYouVideoScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("For you video screen",
        style: TextStyle(
          color: Colors.white,
        ),)
      )
    );
  }
}
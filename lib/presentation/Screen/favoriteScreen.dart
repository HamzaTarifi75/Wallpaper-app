import 'package:flutter/material.dart';

class favoriteScreen extends StatefulWidget {
  const favoriteScreen({Key? key}) : super(key: key);

  @override
  State<favoriteScreen> createState() => _favoriteScreenState();
}

class _favoriteScreenState extends State<favoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        'favorite Screen',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

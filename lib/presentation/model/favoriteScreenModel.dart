import 'package:flutter/material.dart';

class FavoriteModel extends StatefulWidget {
  const FavoriteModel({Key? key}) : super(key: key);

  @override
  State<FavoriteModel> createState() => _FavoriteModelState();
}

class _FavoriteModelState extends State<FavoriteModel> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Favorite Screen'),
    );
  }
}

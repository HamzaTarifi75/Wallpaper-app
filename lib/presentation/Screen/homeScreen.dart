import 'dart:convert';
import 'dart:io';
import 'package:task_josequal/presentation/Screen/detailsScreen.dart';
import 'package:task_josequal/presentation/Screen/favoriteScreen.dart';
import 'package:task_josequal/presentation/Screen/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List image = [];

  // for the first time only
  @override
  void initState() {
    super.initState();
    getImage();
  }

  // get image from API
  Future getImage() async {
    var url = "https://api.pexels.com/v1/curated?per_page=20";

    await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader:
          'IQqhqmoq8z6eXJWSlJqaLUhUtIpJJvXOJHs6KT6YAa3eRK6vTwY3hkKg'
    }).then((value) {
      Map responseBody = jsonDecode(value.body);

      setState(() {
        image = responseBody['photos'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: const Color(0xAA111436),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const searchScreen(),
                  ));
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const favoriteScreen()));
                },
                icon: const Icon(Icons.favorite)),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(7),
          child: GridView.builder(
              itemCount: image.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2 / 3),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => detailsScreen(
                            imgurl: image[index]['src']['large2x'])));
                  },
                  child: Container(
                    color: Colors.black,
                    child: Image.network(image[index]['src']['tiny'],
                        fit: BoxFit.cover),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

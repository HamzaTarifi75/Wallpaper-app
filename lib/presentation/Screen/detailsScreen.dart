import 'package:flutter/material.dart';
import '../model/detailsScreenModel.dart';
import 'favoriteScreen.dart';

class detailsScreen extends StatefulWidget {
  detailsScreen({Key? key, this.imgurl}) : super(key: key);
  late final String? imgurl;

  @override
  State<detailsScreen> createState() => _detailsScreenState();
}

class _detailsScreenState extends State<detailsScreen> {
  detailsModel DetailsModel = detailsModel();
  bool _isFavorite = false;

  _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
        backgroundColor: const Color(0xAA111436),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const favoriteScreen()));
              },
              icon: const Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Image.network(widget.imgurl!)),
          Row(
            children: [
              Expanded(
                child: IconButton(
                    onPressed: _toggleFavorite,
                    icon: _isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border)),
              ),
              Expanded(
                child: IconButton(
                    onPressed: DetailsModel.downloadImage,
                    icon: const Icon(Icons.download)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

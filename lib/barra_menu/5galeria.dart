import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Galeria extends StatelessWidget {
  const Galeria({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria'),
      ),
      body: Gallery(),
    );
  }
}

class Gallery extends StatefulWidget {
  Gallery({Key key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool loading;
  List<String> ids;

  @override
  void initState() {
    loading = true;
    ids = [];

    _loadImageIds();

    super.initState();
  }

  void _loadImageIds() async {
    final url = Uri.parse('https://picsum.photos/v2/list');
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    for (var image in json) {
      ids.add(image['id']);
    }
    setState(() {
      loading = false;
      ids = ids;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ImagePage(ids[index]),
              ),
            );
          },
          child: Image.network(
            'https://picsum.photos/id/${ids[index]}/300/300',
          )),
      itemCount: ids.length,
    );
  }
}

class ImagePage extends StatelessWidget {
  final String id;
  ImagePage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
          'https://picsum.photos/id/$id/600/600',
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:picapp/src/widgets/image_list.dart';
import 'models/image.model.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  List<ImageModel> images = [];

  void fetchImage() async {
    counter += 1;
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/photos/${counter}"));
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      {
        images.add(imageModel);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("let see some pictures"),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}

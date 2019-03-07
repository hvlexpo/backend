import 'package:flutter/material.dart';
import 'package:hvl_expo/models/models.dart';

class ExhibitionPage extends StatelessWidget {
  ExhibitionPage({Key key, this.exhibition}) : super(key: key);

  final Exhibition exhibition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exhibition.name)),
      body: Center(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Go back'),
        icon: Icon(Icons.arrow_back),
        onPressed: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

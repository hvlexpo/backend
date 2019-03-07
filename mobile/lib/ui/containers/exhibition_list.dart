import 'package:flutter/material.dart';
import 'package:hvl_expo/models/models.dart';
import 'package:hvl_expo/ui/containers/exhibition_item.dart';

class ExhibitionList extends StatelessWidget {
  final List<Exhibition> exhibitions;
  final BuildContext context;

  ExhibitionList(this.context, this.exhibitions, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exhibitions.length,
      itemBuilder: (context, i) {
        return ExhibitionItem(exhibition:exhibitions[i]);
      },
    );
  }
}
import 'package:hvl_expo/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hvl_expo/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ExhibitionItem extends StatelessWidget {
  final Exhibition exhibition;

  ExhibitionItem({Key key, this.exhibition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CachedNetworkImage(imageUrl: exhibition.photos.first,),
        title: Text(exhibition.name),
        subtitle: Text(exhibition.description),
        trailing: Text('${exhibition.votes.values.first}'),
      ),
    );
  }
}
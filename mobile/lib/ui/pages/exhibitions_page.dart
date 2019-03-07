import 'package:flutter/material.dart';
import 'package:hvl_expo/ui/containers/loading_indicator.dart';
import 'package:hvl_expo/ui/containers/exhibition_list.dart';
import 'package:hvl_expo/models/models.dart';
import 'package:hvl_expo/data/http/expo_client.dart';
import 'package:hvl_expo/ui/theme/theme.dart';

class ExhibitionsPage extends StatelessWidget {
  ExhibitionsPage({Key key}) : super(key: key);

  final ExpoHttpClient client = ExpoHttpClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exhibitions'),
      ),
      body: FutureBuilder<List<Exhibition>>(
        future: client.fetchExhibitions(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return LoadingIndicator();
            default:
              if (snapshot.hasData) {
                return RefreshIndicator(
                  child: ExhibitionList(context, snapshot.data),
                  onRefresh: () => client.fetchExhibitions(),
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '👇😞👇',
                        style: TextStyle(fontSize: 48),
                      ),
                      Text(
                        'RIP: ${snapshot.error}',
                        style: TextStyle(
                            color: ExpoColors.hvlPrimary, fontSize: 32),
                      ),
                    ],
                  ),
                );
              } else {
                return LoadingIndicator();
              }
          }
        },
      ),
    );
  }
}

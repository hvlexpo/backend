import 'package:flutter/material.dart';
import 'package:hvl_expo/ui/theme/expo_colors.dart';
import '../containers/posts_list.dart';
import '../containers/loading_indicator.dart';
import 'package:hvl_expo/utils/routes.dart';
import 'package:hvl_expo/models/models.dart';
import 'package:hvl_expo/data/http/hvl_client.dart';

class MainPage extends StatelessWidget {
  final String title;
  final HvlHttpClient client = HvlHttpClient(date: DateTime.now());

  MainPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/hvl_logo.png',
          width: 25,
          height: 25,
        ),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Post>>(
        future: client.fetchPosts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return LoadingIndicator();
            default:
              if (snapshot.hasData) {
                return PostsList(context, snapshot.data);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return LoadingIndicator();
              }
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.details, color: ExpoColors.hvlPrimary),
              onPressed: null,
              padding: EdgeInsets.only(left: 50),
            ),
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: ExpoColors.hvlPrimary,
                ),
                onPressed: null,
                padding: EdgeInsets.only(right: 50))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {Navigator.pushNamed(context, Routes.scan)},
        elevation: 4.0,
        icon: Icon(Icons.nfc),
        backgroundColor: ExpoColors.hvlAccent,
        foregroundColor: Colors.white,
        label: Text('Scan'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

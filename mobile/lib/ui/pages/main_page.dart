import 'package:flutter/material.dart';
import 'package:hvl_expo/ui/theme/expo_colors.dart';
import '../containers/loading_indicator.dart';
import 'package:hvl_expo/utils/routes.dart';
import 'package:hvl_expo/data/http/hvl_client.dart';
import 'package:hvl_expo/ui/pages/pages.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class MainPage extends StatefulWidget {
  final HvlHttpClient client = HvlHttpClient(date: DateTime.now());
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();
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
      body: _getPage(currentPage),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: IconButton(
              tooltip: 'Dashboard',
              icon: Icon(
                Icons.dashboard,
                color: currentPage == 0
                    ? ExpoColors.hvlAccent
                    : ExpoColors.hvlPrimary,
              ),
              onPressed: currentPage == 0
                  ? null
                  : () => setState(() {
                        currentPage = 0;
                      }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 50),
            child: IconButton(
              tooltip: 'Settings',
              icon: Icon(
                GroovinMaterialIcons.account_settings,
                color: currentPage == 1
                    ? ExpoColors.hvlAccent
                    : ExpoColors.hvlPrimary,
              ),
              onPressed: currentPage == 1
                  ? null
                  : () => setState(() {
                        currentPage = 1;
                      }),
            ),
          ),
        ],
      )),
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

  _getPage(int page) {
    switch (page) {
      case 0:
        return CalendarPage();
        break;

      case 1:
        return SettingsPage();
        break;
      default:
        return LoadingIndicator();
    }
  }
}

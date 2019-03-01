import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../containers/qr_reader.dart';
import 'package:meta/meta.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

class ScannerPage extends StatefulWidget {
  final List<CameraDescription> cameras;

  ScannerPage({@required this.cameras, Key key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String scannedText = '';

  final errorSnack = SnackBar(
    content: Text('Could not start camera. Do you even have one?'),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[],
      ),
      backgroundColor: ExpoColors.hvlPrimary,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: QrReader(
              cameras: widget.cameras,
              onScanned: _onScanned,
            ),
          ),
          Text(
            scannedText,
            style: TextStyle(
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        label: Text(
          'Go back',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _onScanned(dynamic value) {
    setState(() {
      scannedText = value;
    });
  }
}

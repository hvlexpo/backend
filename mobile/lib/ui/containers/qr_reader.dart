import 'package:flutter/material.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

typedef DynamicCallback(dynamic value);

class QrReader extends StatefulWidget {
  final List<CameraDescription> cameras;
  final DynamicCallback onScanned;

  QrReader({@required this.cameras, this.onScanned, key}) : super(key: key);

  _QrReaderState createState() => _QrReaderState();
}

class _QrReaderState extends State<QrReader> {
  QRReaderController controller;

  @override
  void initState() {
    super.initState();
    _setController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _setController() {
    controller = QRReaderController(
        widget.cameras[0], ResolutionPreset.medium, [CodeFormat.qr],
        (dynamic value) {
      widget.onScanned(value);
      Future.delayed(
          const Duration(microseconds: 10), controller.startScanning);
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startScanning();
    });
  }

  @override
  Widget build(BuildContext context) {
    return !controller.value.isInitialized
        ? _buildError(context)
        : _buildPreview(context);
  }

  Widget _buildPreview(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: QRReaderPreview(controller),
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            'Camera failed to start. Do you even have one?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}

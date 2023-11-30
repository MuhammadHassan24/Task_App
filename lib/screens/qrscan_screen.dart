import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRScanView extends StatefulWidget {
  const QRScanView({super.key});

  @override
  State<QRScanView> createState() => _QRScanViewState();
}

class _QRScanViewState extends State<QRScanView> {
  final GlobalKey qrkey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String? result;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code!;
      });
    });
  }

  dataCopy() {
    if (result!.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: result!));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Copy On ClipBoard")));
    }
  }

  Future openQRcodeLink() async {
    if (result!.isNotEmpty) {
      final Uri _url = Uri.parse(result!);
      await launchUrl(_url);
    }
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scan"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.flash_auto),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: QRView(
              key: qrkey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(borderRadius: 10),
            ),
          ),
          Positioned(
            left: 80,
            right: 80,
            bottom: 100,
            child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.white24),
                onPressed: () async {
                  await openQRcodeLink();
                },
                child: Text("Open")),
          ),
          Positioned(
            bottom: 50,
            left: 25,
            right: 25,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(8)),
              height: 35,
              child: Center(
                  child: GestureDetector(
                onLongPress: () => dataCopy(),
                child: Text(
                  " ${result ?? "Scan Your QR Code"} ",
                  style: TextStyle(color: Colors.white),
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}

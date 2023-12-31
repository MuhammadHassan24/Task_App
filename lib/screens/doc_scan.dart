import 'package:flutter/material.dart';

class DocScanScreen extends StatefulWidget {
  const DocScanScreen({super.key});

  @override
  State<DocScanScreen> createState() => _DocScanScreenState();
}

class _DocScanScreenState extends State<DocScanScreen> {
  // File? _pickedImage;
  // File? _scannedImage;

  // Future<void> _pickImage() async {
  //   final imagePicker = ImagePicker();
  //   final pickedImage =
  //       await imagePicker.pickImage(source: ImageSource.gallery);

  //   if (pickedImage != null) {
  //     setState(() {
  //       _pickedImage = File(pickedImage.path);
  //       _scannedImage = null;
  //     });
  //   }
  // }

  // Future<void> _scanImage() async {
  //   if (_pickedImage != null) {
  //     final scannedImage = await ImageScanner.scanFile(_pickedImage!.path);

  //     setState(() {
  //       _scannedImage = scannedImage;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Document Scan"),
        ),
        body: Column());
  }
}

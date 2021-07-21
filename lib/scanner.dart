import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('扫码界面'),
      ),
      body: ScanView(
        scanAreaScale: .7,
        scanLineColor: Colors.green.shade400,
        onCapture: (data) {
          Navigator.pop(context, data);
        },
      ),
    );
  }
}

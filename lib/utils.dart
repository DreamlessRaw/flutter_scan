import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scan/scanner.dart';

class Utils {
  static void scannerCode(BuildContext context, Function(String) callback) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ScannerPage();
    })).then((value) => callback(value.toString()));
  }
}

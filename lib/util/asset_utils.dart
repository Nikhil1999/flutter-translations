import 'dart:typed_data';

import 'package:flutter/services.dart';

class AssetUtils {
  AssetUtils._();

  static const String _root = 'assets/';
  static const String _csv = '${_root}csv/';

  static const String sampleCsvPath = '${_csv}sample.csv';
  static Future<List<int>> get sampleCsvMemoryFile async =>
      _assetAsMemoryFile(sampleCsvPath);

  ///To convert asset file to memory file
  static Future<List<int>> _assetAsMemoryFile(String assetPath) async {
    ByteData byteData = await rootBundle.load(assetPath);
    return byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)
        .toList();
  }
}

import 'dart:convert';

import 'package:archive/archive.dart';

class ArchiveUtils {
  ArchiveUtils._();

  ///To create zip file from flutter translation
  static List<int> createFlutterTranslationZipFromCsv(
      Map<String, Map<String, String>> csvMap) {
    Archive archiveZipFile = Archive();

    List<String> fileList = csvMap.keys.toList();
    int maxFiles = fileList.length;

    for (int i = 0; i < maxFiles; i++) {
      String fileName = fileList[i];
      String fileContent =
          const JsonEncoder.withIndent('    ').convert(csvMap[fileName]);
      archiveZipFile.addFile(ArchiveFile.noCompress(fileName + '.json',
          fileContent.codeUnits.length, fileContent.codeUnits));
    }

    List<int>? byteList = ZipEncoder().encode(archiveZipFile);

    if (byteList != null) {
      return byteList;
    } else {
      throw UnsupportedError('Unable to generate zip file');
    }
  }

  ///To create zip file from android translation
  static List<int> createAndroidTranslationZipFromCsv(
      Map<String, String> csvXml) {
    Archive archiveZipFile = Archive();

    List<String> fileList = csvXml.keys.toList();
    int maxFiles = fileList.length;

    for (int i = 0; i < maxFiles; i++) {
      String dirName = fileList[i] + '/';
      String fileContent = csvXml[fileList[i]]!;
      archiveZipFile.addFile(ArchiveFile.noCompress(dirName + 'strings.xml',
          fileContent.codeUnits.length, fileContent.codeUnits));
    }

    List<int>? byteList = ZipEncoder().encode(archiveZipFile);

    if (byteList != null) {
      return byteList;
    } else {
      throw UnsupportedError('Unable to generate zip file');
    }
  }
}

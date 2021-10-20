import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_translations/config/app_config.dart';
import 'package:flutter_translations/util/archive_utils.dart';
import 'package:flutter_translations/util/csv_utils.dart';
import 'package:flutter_translations/util/file_utils.dart';
import 'package:flutter_translations/util/translation_utils.dart';
import 'package:universal_html/html.dart';

class CommonUtils {
  CommonUtils._();

  ///To pick csv file
  static Future<PlatformFile?> pickCsvFile() {
    return FileUtils.pickFile(allowedExtensions: AppConfig.allowedExtensions);
  }

  ///To download flutter translations
  static void downloadFlutterTranslations(PlatformFile file) {
    try {
      String csvString = FileUtils.readFileAsString(file);
      List<List<dynamic>> csvList = CsvUtils.convertCsvToList(csvString);
      Map<String, Map<String, String>> csvMap =
          TranslationUtils.convertCsvToJson(csvList);
      List<int> zipBytes =
          ArchiveUtils.createFlutterTranslationZipFromCsv(csvMap);
      downloadFile(zipBytes, AppConfig.flutterTranslationFileName);
    } catch (e) {
      showErrorToast('Something went wrong. Please try again');
    }
  }

  ///To download android translations
  static void downloadAndroidTranslations(PlatformFile file) {
    try {
      String csvString = FileUtils.readFileAsString(file);
      List<List<dynamic>> csvList = CsvUtils.convertCsvToList(csvString);
      Map<String, String> csvXml = TranslationUtils.convertCsvToXml(csvList);
      List<int> zipBytes =
          ArchiveUtils.createAndroidTranslationZipFromCsv(csvXml);
      downloadFile(zipBytes, AppConfig.androidTranslationFileName);
    } catch (e) {
      showErrorToast('Something went wrong. Please try again');
    }
  }

  ///To show success toast
  static void showSuccessToast(String message) {}

  ///To show error toast
  static void showErrorToast(String message) {}

  ///To download file
  static void downloadFile(List<int> bytes, String fileName) {
    AnchorElement anchor = AnchorElement(
        href: "data:application/octet-stream;base64,${base64Encode(bytes)}");
    anchor.download = fileName;
    anchor.target = 'blank';
    anchor.click();
    anchor.remove();
  }
}

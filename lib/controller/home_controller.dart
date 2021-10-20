import 'package:file_picker/file_picker.dart';
import 'package:flutter_translations/util/common_utils.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rxn<PlatformFile?> selectedFile = Rxn<PlatformFile>();

  static const String _flutterTranslation = 'Flutter',
      _androidTranslation = 'Android';
  static const List<String> translations = [
    _flutterTranslation,
    _androidTranslation,
  ];

  final Rx<String> selectedTranslation = _flutterTranslation.obs;

  Future<void> selectFile() async {
    PlatformFile? file = await CommonUtils.pickCsvFile();
    if (file != null) {
      selectedFile.value = file;
    }
  }

  void unselectFile() {
    selectedFile.value = null;
  }

  void selectTranslation(String translationName) {
    selectedTranslation.value = translationName;
  }

  Future<void> downloadTranslations() async {
    if (selectedFile.value == null) {
      return;
    }

    if (!translations.contains(selectedTranslation.value)) {
      return;
    }

    switch (selectedTranslation.value) {
      case _flutterTranslation:
        CommonUtils.downloadFlutterTranslations(selectedFile.value!);
        break;
      case _androidTranslation:
        CommonUtils.downloadAndroidTranslations(selectedFile.value!);
        break;
    }
  }
}

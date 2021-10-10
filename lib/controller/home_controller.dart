import 'package:file_picker/file_picker.dart';
import 'package:flutter_translations/util/common_utils.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<bool> isFileSeleted = false.obs;
  PlatformFile? selectedFile;

  Future<void> selectFile() async {
    PlatformFile? file = await CommonUtils.pickCsvFile();
    if (file != null) {
      selectedFile = file;
      isFileSeleted.value = true;
    }
  }

  void unselectFile() {
    selectedFile = null;
    isFileSeleted.value = false;
  }
}

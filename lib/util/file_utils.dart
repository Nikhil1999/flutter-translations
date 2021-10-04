import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FileUtils {
  FileUtils._();

  /// To pick file from the system
  static Future<PlatformFile?> pickFile(
      {List<String>? allowedExtensions}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: allowedExtensions,
        type: FileType.custom,
        dialogTitle: 'Please select a file',
      );

      if (result != null) {
        return result.files.first;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  ///To read file as a string
  static String readFileAsString(PlatformFile file) {
    Uint8List? bytes = file.bytes;

    if (bytes == null || bytes.isEmpty) {
      throw UnsupportedError('Unable to read input file');
    }

    return String.fromCharCodes(bytes);
  }
}

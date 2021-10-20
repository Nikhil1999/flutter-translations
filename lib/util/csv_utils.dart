import 'package:csv/csv.dart';

class CsvUtils {
  CsvUtils._();

  ///To convert csv string to list
  static List<List<dynamic>> convertCsvToList(String csv) {
    return const CsvToListConverter().convert(csv, allowInvalid: false);
  }
}

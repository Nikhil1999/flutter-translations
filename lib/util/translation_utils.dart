import 'package:xml/xml.dart';

class TranslationUtils {
  TranslationUtils._();

  ///To convert csv list to flutter translation json
  static Map<String, Map<String, String>> convertCsvToJson(
      List<List<dynamic>> csvList) {
    Map<String, Map<String, String>> translations = {};
    int maxTranslations = csvList[0].length - 1;
    int maxTranslationKeys = csvList.length - 1;

    for (int i = 1; i < maxTranslations; i++) {
      Map<String, String> translationKeys = {};
      for (int j = 1; j < maxTranslationKeys; j++) {
        translationKeys[csvList[j][0] as String] = csvList[j][i] as String;
      }
      translations[csvList[0][i] as String] = translationKeys;
    }

    return translations;
  }

  ///To convert csv list to android translation json
  static Map<String, String> convertCsvToXml(List<List<dynamic>> csvList) {
    Map<String, String> translations = {};
    int maxTranslations = csvList[0].length - 1;
    int maxTranslationKeys = csvList.length - 1;

    for (int i = 2; i < maxTranslations; i++) {
      XmlBuilder xmlBuilder = XmlBuilder();
      xmlBuilder.processing('xml', 'version="1.0" encoding="utf-8"');
      xmlBuilder.element('resources', nest: () {
        for (int j = 1; j < maxTranslationKeys; j++) {
          xmlBuilder.element('string', nest: () {
            xmlBuilder.attribute('name', csvList[j][0] as String);
            xmlBuilder.text(csvList[j][i] as String);
          });
        }
      });
      XmlDocument xmlDocument = xmlBuilder.buildDocument();
      translations['values-' + csvList[0][i]] =
          xmlDocument.toXmlString(pretty: true);
    }

    return translations;
  }
}

import 'dart:convert';

class AppConverter {
  AppConverter._();

  static Map<String, dynamic> parseSocketData(dynamic input) {
    if (input == null) return null;
    try {
      if (input is String) {
        return jsonDecode(input);
      }
      return jsonDecode(jsonEncode(input));
    } catch (e) {
      return input;
    }
  }

  static String enumToString(Object enumEntry) {
    final String description = enumEntry.toString();
    final int indexOfDot = description.indexOf('.');
    assert(
    indexOfDot != -1 && indexOfDot < description.length - 1,
    'The provided object "$enumEntry" is not an enum.',
    );
    return description.substring(indexOfDot + 1);
  }

  static T stringToEnum<T>(String string, List<T> values) {
    return values.firstWhere((e) => enumToString(e) == string,
        orElse: () => null);
  }
}

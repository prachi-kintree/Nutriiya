import 'dart:convert';
import 'dart:math';

extension JsonToBase64Extension on Map<String, dynamic> {
  String toJsonAndEncode() {
    // Convert the JSON data to a string
    String jsonString = jsonEncode(this);

    // Encode the JSON string to base64
    String base64String = base64.encode(utf8.encode(jsonString));

    return base64String;
  }

  String prettyPrint() {
    JsonEncoder encoder =
        JsonEncoder.withIndent('  '); // Use two spaces for indentation
    String jsonString = encoder.convert(this);
    return jsonString;
  }

  String toPrintableJson() {
    String formattedJson = JsonEncoder.withIndent('  ').convert(this);
    return formattedJson;
  }
}

extension ListExtensions<T> on List<T> {
  T getRandomElement() {
    if (isEmpty) {
      throw StateError("The list is empty");
    }
    final random = Random();
    return this[random.nextInt(length)];
  }
}

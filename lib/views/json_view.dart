import 'dart:convert';

import 'view.dart';

class JsonView implements View {
  @override
  String render(String? filename, {Map<String, dynamic>? params}) {
    // You can implement logic here to load and render JSON data
    // For example, you might load a JSON file or convert a Dart object to JSON
    var jsonData = params ?? {};
    return jsonEncode(jsonData);
  }
}

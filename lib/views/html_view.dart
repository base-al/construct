import 'dart:io';

import 'package:construct/views/view.dart';
import 'package:path/path.dart';

class HtmlView implements View {
  @override
  String render(String filename, {Map<String, dynamic>? params}) {
    var filePath = join('app', 'views', filename);
    var file = File(filePath);

    if (file.existsSync()) {
      var template = file.readAsStringSync();
      params?.forEach((key, value) {
        print('Replacing $key with $value');
        template = template.replaceAll('{{ $key }}', value.toString());
      });
      print('Returning template: $template');
      return template;
    } else {
      throw Exception('File not found: $filePath');
    }
  }
}

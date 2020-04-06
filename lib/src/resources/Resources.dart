import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;

class Resources {
  static Future<Map<String, dynamic>> loadJsonFile(String filepath,
      {bool cache = false}) async {
    var content = await new File(filepath).readAsString();
    return json.decode(content);
  }

  static Future<String> loadTextFile(String filepath,
      {bool cache = false}) async {
    return await new File(filepath).readAsString();
  }

  final String path;

  Resources(this.path);

  Future<Map<String, dynamic>> loadJson(String subpath,
      {bool cache = false}) async {
    if (!subpath.toLowerCase().endsWith('.json')) subpath += '.json';
    String fullpath = '/$subpath';

    try {
      return Resources.loadJsonFile(fullpath);
    } catch (e) {
      final content = await rootBundle.loadString(path, cache: cache);
      return json.decode(content);
    }
  }
}

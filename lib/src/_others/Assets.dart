/*import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:simply_injector/simply_injector.dart';

class Assets extends FinalClass<Assets> {
  final bool useTestAssets;

  Assets({this.useTestAssets = false});

  File loadFile(String filename) {
    var path = join(Directory.current.path, 'resources');
    if (useTestAssets) path = join(Directory.current.path, 'test_resources');
    path = join(path, filename);
    return new File(path);
  }

  Future<Map<String, dynamic>> loadJsonFile(String filename) async {
    if (!filename.toLowerCase().endsWith('.json')) filename += '.json';
    var path = join(Directory.current.path, 'resources');
    if (useTestAssets) path = join(Directory.current.path, 'test_resources');
    path = join(path, 'json', filename);
    String content = await new File(path).readAsString();
    return json.decode(content);
  }
}
*/

import 'package:clean_architecture/src/resources/Resources.dart';
import 'package:test/test.dart';

void main() {
  group('Resources tests', () {
    test("Load json file", () async {
      Map<String, dynamic> map =
          await Resources.loadJsonFile('test/res/test.json');
      expect(map, isNotNull);
      expect(map, contains('integer'));
      expect(map, contains('string'));
      expect(map, contains('double'));
      expect(map, contains('user'));
    });

    test("Load text file", () async {
      String text = await Resources.loadTextFile('test/res/test.text');
      expect(text, isNotNull);
      expect(text, isNotEmpty);
      expect(text, contains('Lorem ipsum'));
    });
  });
}

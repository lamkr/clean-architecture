import 'package:clean_architecture/application.dart';
import 'package:test/test.dart';

import 'TestApplication.dart';

void main() {
  group('IApplication tests', () {
    IApplication application;

    test('Check if context of the application is initialized', () {
      application = new TestApplication();
      expect(application.context, isNotNull);
    });
  });
}

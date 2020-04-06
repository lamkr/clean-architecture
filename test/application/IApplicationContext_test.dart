import 'package:clean_architecture/clean_architecture.dart';
import 'package:test/test.dart';

import 'TestApplication.dart';

void main() {
  group('IApplicationContext tests', () {
    IApplication application;

    setUp(() {
      application = new TestApplication();
    });

    test("Check if the informations was initialized", () {
      expect(application.context.appInfo, isNotNull);
    });

    test("Check if the logger was initialized", () {
      expect(application.context.logger, isNotNull);
    });

    test("Check if the injector was initialized", () {
      expect(application.context.injector, isNotNull);
    });
  });
}

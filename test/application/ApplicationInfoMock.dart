import 'package:clean_architecture/application.dart';

class ApplicationInfoMock implements IAppInfo {
  @override
  String get appName => 'test';

  @override
  String get buildNumber => '1000000';

  @override
  String get packageName => 'test';

  @override
  String get version => '1.0.0';
}

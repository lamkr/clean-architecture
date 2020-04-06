import 'package:clean_architecture/clean_architecture.dart';

import 'ApplicationInfoMock.dart';

class TestApplicationContext implements IApplicationContext {
  TestApplicationContext();

  @override
  IAppInfo get appInfo => ApplicationInfoMock();

  @override
  IInjector get injector => SimplyInjectorProvider.instance();

  @override
  ILogger get logger => ConsoleLogger();
}

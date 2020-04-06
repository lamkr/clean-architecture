import 'package:clean_architecture/di.dart';
import 'package:clean_architecture/log.dart';

import 'IApplicationInfo.dart';

abstract class IApplicationContext {
  IAppInfo get appInfo;
  ILogger get logger;
  IInjector get injector;
}

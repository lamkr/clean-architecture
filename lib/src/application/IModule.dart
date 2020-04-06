import 'IApplicationContext.dart';

abstract class IModule {
  String get name;
  String get title;

  void initialize(IApplicationContext context);
}

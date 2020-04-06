import 'package:clean_architecture/clean_architecture.dart';

import 'TestApplicationContext.dart';

/// **References:**
/// - https://blog.mindorks.com/understanding-context-in-android-application-330913e32514
/// - https://softwareengineering.stackexchange.com/questions/281972/what-is-a-context-object-in-relation-to-a-web-application
class TestApplication extends IApplication {
  TestApplication() : _context = new TestApplicationContext();

  final IApplicationContext _context;

  @override
  IApplicationContext get context => _context;

  /// Register customized dependencies. This method needs be called if overridden.
//  @mustCallSuper
//  void onRegisterDependencies(IInjector injector) {}
}

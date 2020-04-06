import 'dart:async';

import 'package:clean_architecture/di.dart';
import 'package:clean_architecture/src/di/IInjector.dart';
import 'package:flutter/material.dart';

abstract class Application {
  /// Before to start the application execution, this method calls
  /// [onInitializeDependencyInjectionProvider]; after, it calls
  /// [onRegisterDependencies] and, finally, it calls [createMainWidget]
  /// to get the instance of main widget, such as [MaterialApp], for example.
  @mustCallSuper
  void run() {
    onInitializeDependencyInjectionProvider().then((injector) =>
        onRegisterDependencies(injector)
            .then((injector) => runApp(createMainWidget(injector))));
  }

  /// If this method is not overridden, it returns an instance of [SimplyInjectorProvider].
  @mustCallSuper
  Future<IInjector> onInitializeDependencyInjectionProvider() =>
      Future.value(SimplyInjectorProvider.instance());

  /// Override this method to inject the dependencies used by application.
  /// By default, this is a empty method.
  Future<IInjector> onRegisterDependencies(IInjector injector) =>
      Future.value(injector);

  /// Returns an instance of main widget of the Flutter application.
  /// Usually, the widget returned is a [MaterialApp].
  Widget createMainWidget(IInjector injector);
}

mixin Application2 {
  /// Before to start the application execution, this method calls
  /// [onInitializeDependencyInjectionProvider]; after, it calls
  /// [onRegisterDependencies] and, finally, it calls [createMainWidget]
  /// to get the instance of main widget, such as [MaterialApp], for example.
  @mustCallSuper
  void run() {
    onInitializeDependencyInjectionProvider().then((injector) =>
        onRegisterDependencies(injector)
            .then((injector) => runApp(createMainWidget(injector))));
  }

  /// If this method is not overridden, it returns an instance of [SimplyInjectorProvider].
  @mustCallSuper
  Future<IInjector> onInitializeDependencyInjectionProvider() =>
      Future.value(SimplyInjectorProvider.instance());

  /// Override this method to inject the dependencies used by application.
  /// By default, this is a empty method.
  @mustCallSuper
  Future<Null> onRegisterDependencies(IInjector injector) => Future.value();

  /// Returns an instance of main widget of the Flutter application.
  /// Usually, the widget returned is a [MaterialApp].
  Widget createMainWidget(IInjector injector);
}

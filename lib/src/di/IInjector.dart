import '../types.dart';

abstract class IInjector {
  bool isRegistered<T>();

  void registerSingleton<T>(Constructor<T> constructor);

  T get<T>();
}

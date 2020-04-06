import 'package:clean_architecture/src/common/FinalClass.dart';
import 'package:clean_architecture/src/di/IInjector.dart';
import 'package:simply_injector/simply_injector.dart' hide FinalClass;

class SimplyInjectorProvider extends FinalClass<SimplyInjectorProvider>
    implements IInjector {
  static SimplyInjectorProvider _instance;

  final Container _container = SimplyInjector.Container();

  factory SimplyInjectorProvider.instance() {
    if (_instance == null) {
      _instance = SimplyInjectorProvider._();
    }
    return _instance;
  }

  SimplyInjectorProvider._() : super();

  @override
  bool isRegistered<T>() {
    try {
      // TODO simply_injector: add method isRegistered.
      return _container.getInstance<T>() != null;
    } catch (e) {
      return false;
    }
  }

  @override
  void registerSingleton<T>(Constructor<T> constructor) {
    _container.registerSimple<T>(constructor, Lifestyle.Singleton);
  }

  @override
  T get<T>() => _container.getInstance<T>();
}

import 'package:clean_architecture/clean_architecture.dart';
import 'package:test/test.dart';

void main() {
  group('IInjector tests', () {
    IInjector injector;

    setUp(() {
      injector = SimplyInjectorProvider.instance();
    });

    test("Check if the informations was initialized", () {
      injector.registerSingleton<IValue>(() => Value());
      expect(injector.get<IValue>(), isA<IValue>());
    });
  });
}

abstract class IValue {
  Object get value;
  set value(Object value);
}

class Value implements IValue {
  Object _value;

  @override
  Object get value => _value;

  @override
  set value(Object value) => _value = value;
}

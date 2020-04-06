// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clean_architecture/clean_architecture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TestApplication app = TestApplication();
  IInjector _injector;

  setUpAll(() {
    app.onInitializeDependencyInjectionProvider().then(
          (injector) => app.onRegisterDependencies(injector).then(
            (injector) {
              _injector = injector;
            },
          ),
        );
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app.createMainWidget(_injector));

    // Verify that our counter starts at 0.
    expect(find.text('This is a test'), findsOneWidget);
    //expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    //await tester.tap(find.byIcon(Icons.add));
    //await tester.pump();

    // Verify that our counter has incremented.
    //expect(find.text('0'), findsNothing);
    //expect(find.text('1'), findsOneWidget);
  });
}

class TestApplication extends Application {
  @override
  Widget createMainWidget(IInjector injector) =>
      TestWidget(injector.get<ILogger>());

  @override
  Future<IInjector> onRegisterDependencies(IInjector injector) {
    injector.registerSingleton<ILogger>(() => ConsoleLogger());
    return Future.value(injector);
  }
}

class TestWidget extends StatelessWidget {
  final ILogger logger;

  TestWidget(this.logger);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: Text(
        'This is a test',
        key: Key('textMessage'),
      ),
    );
  }
}

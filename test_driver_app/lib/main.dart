import 'package:clean_architecture/clean_architecture.dart';
import 'package:clean_architecture/resources.dart';
import 'package:flutter/material.dart';

void main() => AppForTest().run();

class AppForTest extends Application {
  @override
  Widget createMainWidget(IInjector injector) => AppForTestWidget(injector);
}

class AppForTestWidget extends StatelessWidget {
  final IInjector injector;

  AppForTestWidget(this.injector);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: HomePageForTest(title: 'App for test'),
    );
  }
}

class HomePageForTest extends StatefulWidget {
  HomePageForTest({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageForTestState createState() => _HomePageForTestState();
}

class _HomePageForTestState extends State<HomePageForTest> {
  final Resources resources;
  Map<String, dynamic> _jsonAsset = {};

  _HomePageForTestState() : resources = Resources('test/res');

  void _loadJsonAsset() {
    resources.loadJson('test.json').then((map) {
      setState(() {
        _jsonAsset = map;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _jsonAsset.toString(),
              // Provide a Key to this specific Text widget. This allows
              // identifing the widget from inside the test suite,
              // and reading the text.
              key: Key('jsonAsset'),
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Provide a Key to this button. This allows finding this
        // specific button inside the test suite, and tapping it.
        key: Key('loadJsonAsset'),
        onPressed: _loadJsonAsset,
        tooltip: 'Load json asset',
        child: Icon(Icons.file_upload),
      ),
    );
  }
}

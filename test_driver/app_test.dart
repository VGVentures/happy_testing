import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver flutterDriver;

  setUpAll(() async {
    flutterDriver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (flutterDriver != null) {
      await flutterDriver.close();
    }
  });

  test('interact with the app', () async {
    final fabFinder = find.byType('FloatingActionButton');
    await flutterDriver.getText(find.text(('Value: 1')));
    await flutterDriver.getText(find.text(('This is an odd number!')));
    await flutterDriver.tap(fabFinder);

    await flutterDriver.getText(find.text(('Value: 2')));
    await flutterDriver.getText(find.text(('This is an even number!')));
    await flutterDriver.tap(fabFinder);

    await flutterDriver.getText(find.text(('Value: 3')));
    await flutterDriver.getText(find.text(('This is an odd number!')));
    await flutterDriver.tap(fabFinder);

    await flutterDriver.getText(find.text(('Value: 4')));
    await flutterDriver.getText(find.text(('This is an even number!')));
    await flutterDriver.tap(fabFinder);

    await flutterDriver.getText(find.text(('Value: 5')));
    await flutterDriver.getText(find.text(('This is an odd number!')));
    await flutterDriver.tap(fabFinder);

    await flutterDriver.getText(find.text(('Value: 6')));
    await flutterDriver.getText(find.text(('This is an even number!')));
  });
}

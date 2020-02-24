import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:happy_testing/app/app.dart';
import 'package:mockito/mockito.dart';
import 'package:repository/repository.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  Repository repository;

  setUp(() {
    repository = MockRepository();
  });

  group('HappyTestingApp', () {
    group('constructor', () {
      test('throws AssertionError if repository is null', () {
        try {
          HappyTestingApp(null);
          fail('this code should fail');
        } catch (error) {
          expect(error, isAssertionError);
        }
      });
    });
  });

  testWidgets('shows the message given by the repository',
      (WidgetTester tester) async {
    when(repository.getIncrementMessage(0)).thenAnswer(
        (_) => Future.value(IncrementWithMessage(1, 'This is an odd number!')));
    when(repository.getIncrementMessage(1)).thenAnswer((_) =>
        Future.value(IncrementWithMessage(2, 'This is an even number!')));

    await tester.pumpWidget(HappyTestingApp(repository));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text('Value: 1'), findsOneWidget);
    expect(find.text('This is an odd number!'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Value: 2'), findsOneWidget);
    expect(find.text('This is an even number!'), findsOneWidget);
  });

  testWidgets('shows an error message if the repository fails',
      (WidgetTester tester) async {
    when(repository.getIncrementMessage(0))
        .thenAnswer((_) => Future.error(Exception('ooops')));

    await tester.pumpWidget(HappyTestingApp(repository));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();
    expect(find.text('Something went wrong'), findsOneWidget);
  });
}

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:repository/repository.dart';
import 'package:api/api.dart';

class MockApi extends Mock implements Api {}

void main() {
  Api api;
  Repository repository;

  setUp(() {
    api = MockApi();
    repository = Repository(api);
  });

  group('Repository', () {
    group('constructory', () {
      test('throws AssertionError if api is null', () {
        try {
          Repository(null);
          fail('this code should fail');
        } catch (error) {
          expect(error, isA<AssertionError>());
        }
      });

      test('creates a non null instance', () {
        final repo = Repository.create();
        expect(repo, isNotNull);
      });
    });

    group('getIncrementMessage', () {
      test(
          'returns a message saying it is an odd number if the incremented value is odd',
          () async {
        when(api.increment(any)).thenAnswer((_) => Future.value(3));
        final result = await repository.getIncrementMessage(2);
        expect(result.value, 3);
        expect(result.message, 'This is an odd number!');
      });

      test(
          'returns a message saying it is an even number if the incremented value is even',
          () async {
        when(api.increment(any)).thenAnswer((_) => Future.value(4));
        final result = await repository.getIncrementMessage(3);
        expect(result.value, 4);
        expect(result.message, 'This is an even number!');
      });

      test('throws an Exception if api throws an Exception', () async {
        final expectedException = Exception('Ooops');
        try {
          when(api.increment(any)).thenThrow(expectedException);
          await repository.getIncrementMessage(3);
          fail('This code should fail');
        } catch (error) {
          expect(error, expectedException);
        }
      });
    });
  });
}

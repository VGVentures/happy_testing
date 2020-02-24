import 'package:api/api.dart';
import 'package:test/test.dart';

void main() {
  Api api;

  setUp(() {
    api = Api();
  });

  group('Api', () {
    group('increment', () {
      test('returns 1 when the value given is zero', () async {
        final result1 = await api.increment(0);
        expect(result1, 1);
      });

      test('returns 21 when the value given is 20', () async {
        final result2 = await api.increment(20);
        expect(result2, 21);
      });

      test('returns -74 when the value given is -75', () async {
        final result3 = await api.increment(-75);
        expect(result3, -74);
      });
    });
  });
}

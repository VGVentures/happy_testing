import 'package:repository/repository.dart';
import 'package:api/api.dart';

class Repository {
  final Api api;

  Repository(this.api) : assert(api != null);

  factory Repository.create() {
    final api = Api();
    return Repository(api);
  }

  Future<IncrementWithMessage> getIncrementMessage(int value) async {
    final incrementedValue = await api.increment(value);
    final message = incrementedValue.isEven
        ? 'This is an even number!'
        : 'This is an odd number!';
    return IncrementWithMessage(incrementedValue, message);
  }
}

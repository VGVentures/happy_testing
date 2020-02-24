class Api {
  Future<int> increment(int value) {
    final result = value + 1;
    return Future.delayed(Duration(seconds: 1), () => Future.value(result));
  }
}

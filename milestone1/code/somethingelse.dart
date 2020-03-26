// generator function that returns a stream of numbers 0-10
Stream<int> mkStream() async* {
  for (int i = 0; i < 10; i++) {
    yield i;
  }
}

main() {
    var nums = mkStream();
    nums.forEach((num) => print(num));
}
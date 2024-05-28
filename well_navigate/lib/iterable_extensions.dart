extension IterableExtensions<T> on Iterable<T> {
  List<T> toSortedList([
    int Function(T a, T b)? compare,
  ]) {
    final newList = toList();
    // ignore: cascade_invocations
    newList.sort(compare);
    return newList;
  }
}

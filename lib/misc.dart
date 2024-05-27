extension IterableExtensions<E> on Iterable<E> {
  E? firstWhereOrNull(
    bool Function(E element) test,
  ) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

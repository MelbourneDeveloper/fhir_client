import 'dart:collection';
import 'dart:math';

const String cantModifyErrorMessage =
    'This collection is immutable. You cannot modify it';

///An immutable [List].  See the package fixed_collections
///https://pub.dev/packages/fixed_collections
///Ensure that you promote deprecated_member_use_from_same_package to error
class FixedList<E> extends ListBase<E> {
  FixedList(Iterable<E> items) : _innerList = List<E>.unmodifiable(items);

  FixedList.empty() : _innerList = List<E>.unmodifiable([]);
  final List<E> _innerList;

  //---------------------------------------------------------------------
  //No mutation
  @override
  E operator [](int index) => _innerList[index];

  @override
  int get length => _innerList.length;

  //---------------------------------------------------------------------

  //---------------------------------------------------------------------
  //Deprecated
  @Deprecated(cantModifyErrorMessage)
  @override
  void clear();

  @Deprecated(cantModifyErrorMessage)
  @override
  void add(E element);

  @Deprecated(cantModifyErrorMessage)
  @override
  void addAll(Iterable<E> iterable) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  bool remove(Object? element) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  E removeAt(int index) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  E removeLast() {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  E removeRange(int start, int end) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  E removeWhere(bool Function(E element) test) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  E replaceRange(int start, int end, Iterable<E> newContents) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  E retainWhere(bool Function(E element) test) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  void setAll(int index, Iterable<E> iterable) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  set length(int length) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  void operator []=(int index, E value) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  void insert(int index, E element) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  void insertAll(int index, Iterable<E> iterable) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  void fillRange(int start, int end, [E? fill]);

  @Deprecated(cantModifyErrorMessage)
  @override
  void sort([int Function(E a, E b)? compare]) {
    throw UnsupportedError(cantModifyErrorMessage);
  }

  @Deprecated(cantModifyErrorMessage)
  @override
  void shuffle([Random? random]) {
    throw UnsupportedError(cantModifyErrorMessage);
  }
  //---------------------------------------------------------------------
}

extension IterableExtensions<T> on Iterable<T> {

  /// Converts an [Iterable] to a [FixedList]
  FixedList<T> toFixedList() => FixedList<T>(this);

  /// Sorts the list in but it's immutable
  FixedList<T> orderBy([int Function(T a, T b)? compare]) =>
      (toList()..sort(compare)).toFixedList();
}

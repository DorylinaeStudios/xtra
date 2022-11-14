import 'xtable.dart';
import 'xcolumn.dart';

class Collection<T> {
  List<T> _collection = [];

  operator [](int index) => _collection[index];

  operator []=(int index, T value) {
    _collection[index] = value;
  }

  void add(T value) {
    _collection.add(value);
  }

  T last() {
    return _collection[_collection.length - 1];
  }

  int get length {
    return _collection.length;
  }

  Collection() {}
}

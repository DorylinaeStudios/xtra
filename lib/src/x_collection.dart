/// Stores a single collection of data entries as a [List] of [T].
///
/// Used by [XColumn] to store the data entries within an [XTable].
class XCollection<T> {
  /// The variable this collections data is stored in.
  final List<T> _xCollection = [];
  List<T> get xCollection => _xCollection;

  /// Type of collection in [XCollection].
  Type get type => T;

  /// Gets the amount of data entries.
  int get length => _xCollection.length;

  /// Get data entry by index.
  operator [](int index) => _xCollection[index];

  /// Set data entry at an index to a value.
  ///
  /// Entry must already exist, if you want to create a new value, use [add()].
  operator []=(int index, T value) {
    _xCollection[index] = value;
  }

  /// Creates a new data entry and sets it to [value].
  void add(T value) {
    _xCollection.add(value);
  }

  /// Gets the last data entry.
  T last() {
    return _xCollection[_xCollection.length - 1];
  }
}

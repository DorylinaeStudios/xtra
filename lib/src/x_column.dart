import 'x_collection.dart';
import 'x_table.dart';

/// A Column in an [XTable] containing an [XCollection] of values of type [T].
class XColumn<T> {
  /// The assigned [XTable].
  late XTable _xTable;

  /// Gets the assigned [XTable].
  XTable get xTable => _xTable;

  /// The name of this [XColumn].
  late String _xColumnName;

  /// Gets the name of this [XColumn].
  String get xColumnName => _xColumnName;

  /// Whether the [XColumn] should automatically increment.
  ///
  /// If true [T] has to be numeric.
  /// Defaults to false.
  late bool _autoInc;

  /// The number autoInc starts on.
  ///
  /// Defaults to 0.
  late int _autoIncSeed;

  /// The amount autoInc increases the value by each new entry.
  ///
  /// Defaults to 1.
  late int _autoIncStep;

  /// Holds the data in this [XColumn].
  final XCollection _xCollection = XCollection();

  /// Sets up the [XColumn].
  XColumn(
    // required
    XTable xTable,
    String xColumnName,

    // optional
    {
    bool autoInc = false,
    int autoIncSeed = 0,
    int autoIncStep = 1,
  }) {
    _xTable = xTable;
    _xColumnName = xColumnName;

    _autoInc = autoInc;
    _autoIncSeed = autoIncSeed;
    _autoIncStep = autoIncStep;

    // Checks for autoInc and makes sure it is valid
    if (_autoInc == true) {
      if (!numeric) {
        throw ArgumentError(
            "Type is $T, not numeric but autoInc is set to true");
      }
    }
  }

  /// Get data entry by index.
  operator [](int index) => _xCollection[index];

  /// Set data entry at an index to a value.
  ///
  /// Entry must already exist, if you want to create a new value, use [add()].
  operator []=(int index, T other) {
    _xCollection[index] = other;
  }

  /// Whether [T] is numeric or not.
  bool get numeric {
    try {
      T _ = 1 as T;
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Whether null is allowed or not.
  bool get nullAllowed {
    if (_autoInc) {
      return true;
    }
    return false;
  }

  /// Creates a new data entry.
  ///
  /// Sets it to [value] if [_autoInc] is false.
  /// Sets it automatically if [_autoInc] is true.
  void add([T? value]) {
    if (value == null) {
      if (_autoInc) {
        autoInc();
        return;
      }

      throw ArgumentError("Null not allowed unless autoInc is true");
    }

    _xCollection.add(value);
  }

  /// Creates a new entry which is automatically incremented
  void autoInc() {
    if (_xCollection.length > 0) {
      _xCollection.add(_xCollection.last() + _autoIncStep);
    } else {
      _xCollection.add(_autoIncSeed);
    }
  }
}

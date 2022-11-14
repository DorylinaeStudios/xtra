import 'xcollection.dart';
import 'xtable.dart';

class XColumn<T> {
  // required //
  late XTable _table;
  XTable get table => _table;

  late String _columnName;
  String get columnName => _columnName;

  // optional //

  // auto incrementation
  late bool _autoInc;
  late int _autoIncSeed;
  late int _autoIncStep;

  // the data in the column
  late Collection _collection = Collection();

  XColumn(
    // required
    XTable table,
    String columnName,

    // optional
    {
    bool autoInc = false,
    int autoIncSeed = 0,
    int autoIncStep = 1,
  }) {
    _table = table;
    _columnName = columnName;

    _autoInc = autoInc;
    _autoIncSeed = autoIncSeed;
    _autoIncStep = autoIncStep;

    if (_autoInc == true) {
      if (T != int && T != dynamic) {
        throw ArgumentError(
            "Type is $T, not int or dynamic but autoInc is xset to true");
      }
    }
  }

  operator [](int index) => _collection[index];

  operator []=(int index, T other) {
    _collection[index] = other;
  }

  bool get nullAllowed {
    if (_autoInc) {
      return true;
    }
    return false;
  }

  void add([T? value]) {
    if (_autoInc) {
      autoInc();
      return;
    }

    if (value == null) {
      throw ArgumentError("Null not allowed unless autoInc is true");
    }

    _collection.add(value);
  }

  void autoInc() {
    if (_collection.length > 0) {
      _collection.add(_collection.last() + _autoIncStep);
    } else {
      _collection.add(_autoIncSeed);
    }
  }
}

import 'collection.dart';
import 'table.dart';

class Column<T> {
  // required //
  late Table _table;
  late String _columnName;

  // optional //

  // auto incrementation
  late bool _autoInc;
  late int _autoIncSeed;
  late int _autoIncStep;

  // the data in the column
  late Collection _collection = Collection();

  Column(
    // required
    Table table,
    String columnName,

    // optional
    {
    bool autoInc = false,
    int autoIncSeed = 0,
    int autoIncStep = 1,
  }) {
    this._table = table;
    this._columnName = columnName;

    this._autoInc = autoInc;
    this._autoIncSeed = autoIncSeed;
    this._autoIncStep = autoIncStep;

    if (this._autoInc == true) {
      if (T != int && T != dynamic) {
        throw ArgumentError(
            "Type is $T, not int or dynamic but autoInc is set to true");
      }
    }
  }

  operator [](int index) => _collection[index];

  operator []=(int index, T other) {
    _collection[index] = other;
  }

  String get columnName => _columnName;

  bool get nullAllowed {
    if (_autoInc) {
      return true;
    }
    return false;
  }

  void add([T? value = null]) {
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

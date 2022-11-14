import 'xtable.dart';
import 'xcolumn_collection.dart';
import 'xcolumn.dart';

class XRow {
  // required //
  late XTable _table;
  XTable get table => _table;

  late int _record;
  int get record => _record;

  late XColumnCollection _columns;

  XRow(
    XTable table,
    int record,
    XColumnCollection columns,
    Map<String, dynamic> entries,
  ) {
    _table = table;
    _record = record;
    _columns = columns;

    for (String columnName in _columns.names) {
      if (entries.containsKey(columnName)) {
        _columns[columnName].add(entries[columnName]);
      } else {
        if (_columns[columnName].nullAllowed) {
          _columns[columnName].add();
        } else {
          throw ArgumentError("$columnName cannot be null");
        }
      }
    }
  }

  @override
  String toString() {
    for (int i = 0; i < _columns.length; i++) {
      String columnName = _columns.names[i];
    }
    List<String> text = [];
    for (String columnName in _columns.names) {
      text.add("$columnName: ${this[columnName]}");
    }

    return "{${text.join(", ")}}";
  }

  // Gets data value stored in column. Allows: String var = row["column"];
  operator [](String columnName) {
    XColumn column = _columns[columnName];
    return column[_record];
  }

  // XSets data value stored in column. this allows: row["column"] = "some object"
  operator []=(String columnName, dynamic value) {
    _columns[columnName][_record] = value;
  }
}

import 'table.dart';
import 'column_collection.dart';
import 'column.dart';

class Row {
  late Table _table;
  late int _record;

  late ColumnCollection _columns;

  Row(
    Table table,
    int record,
    ColumnCollection columns,
    Map<String, dynamic> entries,
  ) {
    this._table = table;
    this._record = record;
    this._columns = columns;

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

    return "[ ${text.join(", ")} ]";
  }

  // Gets data value stored in column. Allows: String var = row["column"];
  operator [](String columnName) {
    Column column = _columns[columnName];
    return column[_record];
  }

  // Sets data value stored in column. this allows: row["column"] = "some object"
  operator []=(String columnName, dynamic value) {
    _columns[columnName][_record] = value;
  }
}

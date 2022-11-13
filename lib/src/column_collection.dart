import 'column.dart';

class ColumnCollection {
  // properties
  late Map<String, Column> _columns; // Links names to columns

  ColumnCollection() {
    this._columns = new Map<String, Column>();
  }

  operator [](String columnName) {
    return _columns[columnName];
  }

  void add(Column column) {
    _columns[column.columnName] = column;
  }

  int get length => _columns.length;

  List<String> get names => _columns.keys.toList();
}

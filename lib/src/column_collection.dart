import 'data_column.dart';

class ColumnCollection {
  // properties
  late Map<String, DataColumn> _columns; // Links names to columns

  ColumnCollection() {
    this._columns = new Map<String, DataColumn>();
  }

  operator [](String columnName) {
    return _columns[columnName];
  }

  void add(DataColumn column) {
    _columns[column.columnName] = column;
  }
}

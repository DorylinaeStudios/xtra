import 'row.dart';

class RowCollection {
  // properties
  late List<Row> _rows; // Links names to columns

  RowCollection() {
    this._rows = [];
  }

  operator [](int index) {
    return _rows[index];
  }

  void add(Row row) {
    _rows.add(row);
  }

  int get length => _rows.length;
}

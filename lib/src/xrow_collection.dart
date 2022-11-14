import 'xrow.dart';

class XRowCollection {
  late List<XRow> _rows;

  XRowCollection() {
    _rows = [];
  }

  operator [](int index) {
    return _rows[index];
  }

  void add(XRow row) {
    _rows.add(row);
  }

  int get length => _rows.length;
}

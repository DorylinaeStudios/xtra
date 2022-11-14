import 'xrow.dart';

class XRowCollection {
  final List<XRow> _rows = [];

  int get length => _rows.length;

  operator [](int index) {
    return _rows[index];
  }

  void add(XRow row) {
    _rows.add(row);
  }
}

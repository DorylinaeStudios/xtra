import 'x_row.dart';

class XRowCollection {
  final List<XRow> _xRows = [];

  /// Converts [XRowCollection] to string for nice output.
  @override
  String toString() {
    return "${_xRows.join("\n")}";
  }

  int get length => _xRows.length;

  operator [](int index) {
    return _xRows[index];
  }

  void add(XRow row) {
    _xRows.add(row);
  }
}

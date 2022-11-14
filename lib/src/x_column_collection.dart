import 'x_column.dart';

class XColumnCollection {
  final Map<String, XColumn> _xColumns = <String, XColumn>{};

  operator [](String xColumnName) {
    return _xColumns[xColumnName];
  }

  void add(XColumn xColumn) {
    _xColumns[xColumn.xColumnName] = xColumn;
  }

  int get length => _xColumns.length;

  List<String> get names => _xColumns.keys.toList();
}

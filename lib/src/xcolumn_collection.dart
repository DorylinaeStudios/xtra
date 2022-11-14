import 'xcolumn.dart';

class XColumnCollection {
  final Map<String, XColumn> _columns = <String, XColumn>{};

  operator [](String columnName) {
    return _columns[columnName];
  }

  void add(XColumn column) {
    _columns[column.columnName] = column;
  }

  int get length => _columns.length;

  List<String> get names => _columns.keys.toList();
}

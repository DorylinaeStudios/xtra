import 'x_table.dart';

class XTableCollection {
  final Map<String, XTable> _xTables = <String, XTable>{};

  operator [](String xColumnName) {
    return _xTables[xColumnName];
  }

  void add(XTable xTable) {
    _xTables[xTable.xTableName] = xTable;
  }

  int get length => _xTables.length;

  List<String> get names => _xTables.keys.toList();
}

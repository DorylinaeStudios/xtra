import 'xtable.dart';

class XTableCollection {
  final Map<String, XTable> _tables = <String, XTable>{};

  operator [](String columnName) {
    return _tables[columnName];
  }

  void add(XTable table) {
    _tables[table.tableName] = table;
  }

  int get length => _tables.length;

  List<String> get names => _tables.keys.toList();
}

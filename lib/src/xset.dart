import 'package:xtra/src/xtable_collection.dart';

import 'xtable.dart';

class XSet {
  late String _xsetName;
  String get xsetName => _xsetName;

  XTableCollection tables = XTableCollection();

  // Constructor
  XSet(String xsetName) {
    _xsetName = xsetName;
  }

  void addXTable(String tableName) {
    XTable table = XTable(tableName, this);

    tables.add(table);
  }
}

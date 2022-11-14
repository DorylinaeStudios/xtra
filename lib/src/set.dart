import 'table.dart';

class Set {
  late String _setName;

  List<Table> tables = [];

  // Constructor
  Set(String setName) {
    this._setName = setName;
  }

  // Finds a table inside this set by name
  Table getTable(String tableName) {
    for (int i = 0; i < tables.length; i++) {
      if (tables[i].tableName == tableName) {
        return tables[i];
      }
    }
    throw Exception(
        "No table named $tableName could be found in the set $_setName");
  }
}

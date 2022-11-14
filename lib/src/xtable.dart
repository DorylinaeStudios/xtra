import 'xcolumn_collection.dart';
import 'xcolumn.dart';
import 'xrow.dart';
import 'xrow_collection.dart';
import 'xset.dart';

class XTable {
  late XSet? _xset;
  XSet? get xset => _xset;

  late String _tableName;
  String get tableName => _tableName;

  XColumnCollection columns = XColumnCollection();
  XRowCollection rows = XRowCollection();

  XTable(String tableName, [XSet? xset]) {
    _tableName = tableName;
    _xset = xset;
  }

  void addXColumn(
    String columnName,
    Type type,
    // optional
    {
    bool allowNull = false,
    bool autoInc = false,
    int autoIncSeed = 0,
    int autoIncStep = 1,
  }) {
    XColumn column = XColumn(
      this,
      columnName,
      autoInc: autoInc,
      autoIncSeed: autoIncSeed,
      autoIncStep: autoIncStep,
    );

    columns.add(column);
  }

  XRow addXRow(Map<String, dynamic> entries) {
    // Creates a row at the end of the column
    XRow row = XRow(this, rows.length, columns, entries);

    rows.add(row);
    return row;
  }
}

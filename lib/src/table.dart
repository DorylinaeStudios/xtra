import 'column_collection.dart';
import 'column.dart';
import 'row.dart';
import 'row_collection.dart';

class Table {
  late String _tableName;

  ColumnCollection columns = ColumnCollection();
  RowCollection rows = RowCollection();

  Table(String tableName) {
    this._tableName = tableName;
  }

  void addColumn(
    String columnName,
    Type type,
    // optional
    {
    bool allowNull = false,
    bool autoInc = false,
    int autoIncSeed = 0,
    int autoIncStep = 1,
  }) {
    Column column = Column(
      this,
      columnName,
      autoInc: autoInc,
      autoIncSeed: autoIncSeed,
      autoIncStep: autoIncStep,
    );

    columns.add(column);
  }

  Row addRow(Map<String, dynamic> entries) {
    Row row = Row(this, rows.length, columns, entries);

    rows.add(row);
    return row;
  }
}

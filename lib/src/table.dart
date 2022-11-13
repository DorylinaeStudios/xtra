import 'column.dart';
import 'row.dart';

class Table {
    late String _tableName;

    List<Column> columns = [];
    List<Row> rows = [];

    Table(
        String tableName
        ) {
        
        this._tableName = tableName;
    }

    Column addColumn(
        String columnName,

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
            allowNull : false,
            autoInc : false,
            autoIncSeed : 0,
            autoIncStep : 1,
            );

        columns.add(column);

        return column;
    }

    Row addRow() {
        Row row = Row(
            this,
            rows.length,
            columns,
            );
        return row;
    }
}
import 'table.dart';

class Row {
    late Table _table;
    late int _record;

    late ColumnCollection _columns;

    Row(
        Table table,
        int record,
        ColumnCollection columns,
        Map<String, dynamic> entries,
        ) {
        this._table = table;
        this._record = record;
        this._columns = columns;

        for(int i = 0; i < _columns.length; i++) {
            if (entries.containing(_columns[i].columnName))
            {
                _columns.add(entries[_columns[i].columnName]);
            }
        }
        entries.forEach((String columnName, dynamic val) => this[columnName] = val);
    }

    // Gets data value stored in column. Allows: String var = row["column"];
    operator [](String columnName) {
        Column column = _columns[columnName];
        return column[_record];
    }

    // Sets data value stored in column. this allows: row["column"] = "some object"
    operator []=(String columnName, dynamic value) {
        _columns[columnName][_record] = value;
    }
}
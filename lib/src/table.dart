import 'column.dart';

class Table {
    late String _tableName;

    List<Column> columns = [];

    Table(String tableName) {
        this._tableName = tableName;
    }
}
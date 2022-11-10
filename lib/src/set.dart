import 'column.dart';

class Set {
    late String _setName;

    List<Table> tables = [];

    Table(String setName) {
        this._setName = setName;
    }
}
import 'collection.dart';
import 'table.dart';

class Column<T> {
    // required //
    late Table _table;
    late String _columnName;


    // optional //

    // auto incrementation
    late bool _autoInc;
    late int _autoIncSeed;
    late int _autoIncStep;

    // the data in the column
    late Collection _collection = Collection();

    Column(
        // required
        Table table,
        String columnName,

        // optional
        {
            bool allowNull = false,

            bool autoInc = false,
            int autoIncSeed = 0,
            int autoIncStep = 1,
        }) {
        
        this._table = table;
        this._columnName = columnName;
        
        this._autoInc = autoInc;
        this._autoIncSeed = autoIncSeed;
        this._autoIncStep = autoIncStep;

        if (T != int && this._autoInc == true)
        {
            throw ArgumentError("Type is not int but autoInc is set to true");
        }
    }

    operator [](int index) => _collection[index];

    operator []=(int index, T other) {
        _collection[index] = other;
    }

    get columnName => _columnName;

    void add([T? value = null]) {
        if (_autoInc) {
            if (_collection.length > 0)
            {
                _collection.add(_collection.last() + 1);
            }
            else {
                _collection.add(0);
            }
            return;
        }

        if (value == null) {
            throw ArgumentError("Null not allowed unless autoInc is true");
        }

        _collection.add(value);
    }
}
import 'collection.dart';
import 'table.dart';

class Column<T> {
    // required //
    late Table _table;
    late String _columnName;
    late T _defaultValue;

    // optional //
    late bool _allowNull;

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
        T defaultValue,

        // optional
        {
            bool allowNull = true,

            bool autoInc = false,
            int autoIncSeed = 0,
            int autoIncStep = 1,
        }) {
        
        this._table = table;
        this._columnName = columnName;
        this._defaultValue = defaultValue;

        this._allowNull = allowNull;

        this._autoInc = autoInc;
        this._autoIncSeed = autoIncSeed;
        this._autoIncStep = autoIncStep;
    }

    operator [](int index) => _collection[index];
    operator []=(int index, T other) {
        _collection[index] = other;
    }

    void add(T other) {
        _collection.add(other);
    }
}
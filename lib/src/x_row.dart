import 'x_table.dart';
import 'x_column_collection.dart';
import 'x_column.dart';

/// A Row in an [XTable].
///
/// Used to create new rows and access data by row.
class XRow {
  /// The assigned [XTable].
  late XTable _xTable;

  /// Gets the assigned [XTable].
  XTable get xTable => _xTable;

  /// The index of this [XRow].
  late int _record;

  /// Gets the index of this [XRow].
  int get record => _record;

  /// The [XColumn]s in this [XRow].
  late XColumnCollection _xColumns;

  XRow(
    XTable xTable,
    int record,
    XColumnCollection xColumns,
    Map<String, dynamic> entries,
  ) {
    _xTable = xTable;
    _record = record;
    _xColumns = xColumns;

    // Adds the new entries to proper columns
    for (String xColumnName in _xColumns.names) {
      if (entries.containsKey(xColumnName)) {
        _xColumns[xColumnName].add(entries[xColumnName]);
      } else {
        if (_xColumns[xColumnName].nullAllowed) {
          _xColumns[xColumnName].add();
        } else {
          throw ArgumentError("$xColumnName cannot be null");
        }
      }
    }
  }

  /// Converts [XRow] to string for nice output.
  @override
  String toString() {
    List<String> text = [];
    for (String columnName in _xColumns.names) {
      text.add("${this[columnName]}");
    }

    return text.join(", ");
  }

  /// Gets data value stored in [XColumn].
  ///
  /// ```dart
  /// String var = row["column"];
  /// ```
  operator [](String columnName) {
    XColumn column = _xColumns[columnName];

    return column[_record];
  }

  /// [XSet] data value stored in [XColumn].
  ///
  /// ```dart
  /// row["column"] = "some object"
  /// ```
  operator []=(String columnName, dynamic value) {
    _xColumns[columnName][_record] = value;
  }
}

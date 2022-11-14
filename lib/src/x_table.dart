import 'x_column_collection.dart';
import 'x_column.dart';
import 'x_row.dart';
import 'x_row_collection.dart';
import 'x_set.dart';

/// [XTable] replicates database Tables.
class XTable {
  /// The assigned [XSet].
  late XSet? _xSet;

  /// Gets the assigned [XSet].
  XSet? get xSet => _xSet;

  /// The name of this [XTable].
  late String _xTableName;

  /// Gets the name of this [XTable].
  String get xTableName => _xTableName;

  /// Collection of the [XColumn]s in this [XTable].
  XColumnCollection xColumns = XColumnCollection();

  /// Collection of the [XRow]s in this [XTable].
  XRowCollection xRows = XRowCollection();

  /// Sets up the [XTable].
  XTable(String xTableName, [XSet? xSet]) {
    _xTableName = xTableName;
    _xSet = xSet;
  }

  /// Creates a new [XColumn] for the [XTable].
  void addXColumn(
    // required
    String xColumnName,
    Type type,

    // optional
    {
    bool allowNull = false,
    bool autoInc = false,
    int autoIncSeed = 0,
    int autoIncStep = 1,
  }) {
    XColumn xColumn = XColumn(
      this,
      xColumnName,
      autoInc: autoInc,
      autoIncSeed: autoIncSeed,
      autoIncStep: autoIncStep,
    );

    xColumns.add(xColumn);
  }

  /// Creates a new [XRow] for the [XTable].
  XRow addXRow(Map<String, dynamic> entries) {
    // Creates a row at the end of the column
    XRow xRow = XRow(this, xRows.length, xColumns, entries);

    xRows.add(xRow);
    return xRow;
  }
}

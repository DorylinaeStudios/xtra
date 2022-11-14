import 'package:xtra/src/x_table_collection.dart';
import 'x_table.dart';

/// A collection of [XTable]s.
class XSet {
  /// The name of this [XSet].
  late String _xSetName;

  /// Gets the name of this [XSet].
  String get xSetName => _xSetName;

  /// This [XSet]'s [XTable]s.
  XTableCollection xTables = XTableCollection();

  /// Sets up the [XSet].
  XSet(String xSetName) {
    _xSetName = xSetName;
  }

  /// Creates and adds a new [XTable] with name [xTableName]
  void addXTable(String xTableName) {
    XTable xTable = XTable(xTableName, this);

    xTables.add(xTable);
  }
}

import 'x_collection.dart';
import 'x_table.dart';

/// A Column in an [XTable] containing an [XCollection] of values of type [T].
class XColumn<T> {
  /// The assigned [XTable].
  late XTable _xTable;

  /// Gets the assigned [XTable].
  XTable get xTable => _xTable;

  /// The name of this [XColumn].
  late String _xColumnName;

  /// Gets the name of this [XColumn].
  String get xColumnName => _xColumnName;

  /// Whether the [XColumn] should automatically increment.
  ///
  /// If true [T] has to be numeric.
  /// Defaults to false.
  late bool _autoInc;

  /// The number autoInc starts on.
  ///
  /// Defaults to 0.
  late int _autoIncSeed;

  /// The amount autoInc increases the value by each new entry.
  ///
  /// Defaults to 1.
  late int _autoIncStep;

  /// Holds the data in this [XColumn].
  final XCollection<T> _xCollection = XCollection<T>();

  /// Type of collection in [XColumn].
  Type get type => T;

  /// Gets longest entry converted to string as int
  int get longest {
    int _longest = 0;

    for (T entry in _xCollection.xCollection) {
      String entryString = entry.toString();

      if (entryString.length > longest) {
        _longest = entryString.length;
      }
    }

    return _longest;
  }

  /// Sets up the [XColumn].
  XColumn(
    // required
    XTable xTable,
    String xColumnName,

    // optional
    {
    bool autoInc = false,
    int autoIncSeed = 0,
    int autoIncStep = 1,
  }) {
    _xTable = xTable;
    _xColumnName = xColumnName;

    _autoInc = autoInc;
    _autoIncSeed = autoIncSeed;
    _autoIncStep = autoIncStep;

    // Checks for autoInc and makes sure it is valid
    if (_autoInc == true) {
      if (!numeric) {
        throw ArgumentError(
            "Type is $T, not numeric but autoInc is set to true");
      }
    }
  }

  /// Get data entry by index.
  operator [](int index) => _xCollection[index];

  /// Set data entry at an index to a value.
  ///
  /// Entry must already exist, if you want to create a new value, use [add()].
  operator []=(int index, T other) {
    _xCollection[index] = other;
  }

  /// Whether [T] is numeric or not.
  bool get numeric {
    try {
      T _ = 1 as T;
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Whether null is allowed or not.
  bool get nullAllowed {
    if (_autoInc) {
      return true;
    }
    return false;
  }

  /// Converts [XColumn] to string for nice output.
  @override
  String toString() {
    List<String> lines = [];

    // Top Bar
    lines.add("┌${"".padRight(stringLines[0].length + 2, "─")}┐");

    // Headers
    lines.add("│ ${[stringLines[0], stringLines[1]].join(" │\n│ ")} │");

    if (stringLines.length > 2) {
      // Seperator
      lines.add("├${"".padRight(stringLines[0].length + 2, "─")}┤");

      // Content
      stringLines.removeRange(0, 1);
      lines.add("│ ${stringLines.join(" │\n│ ")} │");
    }

    // Bottom Bar
    lines.add("└${"".padRight(stringLines[0].length + 2, "─")}┘");
    return lines.join("\n");
  }

  List<String> get stringLines {
    int longest = 0;

    if (xColumnName.length > longest) {
      longest = xColumnName.length;
    }

    if ("$type".length > longest) {
      longest = "$type".length;
    }

    for (T entry in _xCollection.xCollection) {
      if ("$entry".length > longest) {
        longest = "$entry".length;
      }
    }

    List<String> outputLines = [];

    int padding = longest;

    // Column name
    outputLines.add(xColumnName.padRight(padding));

    // Data Type
    outputLines.add("$type".padRight(padding));

    // Content
    for (T entry in _xCollection.xCollection) {
      outputLines.add("$entry".padRight(padding));
    }
    return outputLines;
  }

  /// Creates a new data entry.
  ///
  /// Sets it to [value] if [_autoInc] is false.
  /// Sets it automatically if [_autoInc] is true.
  void add([T? value]) {
    if (value == null) {
      if (_autoInc) {
        autoInc();
        return;
      }

      throw ArgumentError("Null not allowed unless autoInc is true");
    }

    _xCollection.add(value);
  }

  /// Creates a new entry which is automatically incremented
  ///
  /// Needs better implementation, will produce duplicates if any other than
  /// last entry is deleted.
  void autoInc() {
    if (_xCollection.length > 0) {
      _xCollection.add(_xCollection.length as T);
    } else {
      _xCollection.add(_autoIncSeed as T);
    }
  }
}

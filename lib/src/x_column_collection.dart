import 'x_column.dart';

class XColumnCollection {
  final Map<String, XColumn> _xColumns = <String, XColumn>{};
  Map<String, XColumn> get xColumns => _xColumns;

  int get length => _xColumns.length;

  List<String> get names => _xColumns.keys.toList();

  operator [](String xColumnName) {
    return _xColumns[xColumnName];
  }

  /// Converts [XColumnCollection] to string for nice output.
  @override
  String toString() {
    print("test1");
    List<String> lines = [];

    List<List<String>> linesOfColumns = [];
    for (XColumn xColumn in xColumns.values) {
      linesOfColumns.add(xColumn.stringLines);
    }

    // Content
    List<String> outputLines = [];
    for (int i = 0; i < linesOfColumns[0].length - 1; i++) {
      List<String> outputLine = [];

      for (List<String> linesOfColumn in linesOfColumns) {
        outputLine.add(linesOfColumn[i]);
      }
      outputLines.add("│ ${outputLine.join(" │ ")} │");
    }

    // Bottom Bar but just for first col gotta figure out how to get all and for
    // top bar with ┴┬
    outputLines.add("└${"".padRight(linesOfColumns[0][0].length + 2, "─")}┘");

    return outputLines.join("\n");
  }

  void add(XColumn xColumn) {
    _xColumns[xColumn.xColumnName] = xColumn;
  }
}

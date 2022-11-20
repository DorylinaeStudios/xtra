class XPrinter {
  final String tlJoint = "┌";
  final String trJoint = "┐";
  final String blJoint = "└";
  final String brJoint = "┘";

  final String tJoint = "┬";
  final String bJoint = "┴";
  final String lJoint = "├";
  final String rJoint = "┤";

  final String cJoint = "┼";

  final String hLine = "─";
  final String vLine = "│";

  final String padding = " ";

  String arrayAsTable(List<List<String>> array) {
    // Top Bar
    List<String> outputLine = [];
    for (int maxColumnWidth in _maxColumnWidths(array)) {
      outputLine.add("${"".padRight(maxColumnWidth + 2, hLine)}");
    }

    return "$tlJoint${outputLine.join(tJoint)}$trJoint";
  }

  List<int> _maxColumnWidths(List<List<String>> array) {
    List<int> maxColumnWidths = [];

    for (List<String> column in array) {
      maxColumnWidths.add(_maxColumnWidth(column));
    }

    return maxColumnWidths;
  }

  int _maxColumnWidth(List<String> column) {
    int longest = 0;

    for (String entry in column) {
      if (entry.length > longest) {
        longest = entry.length;
      }
    }

    return longest;
  }
}

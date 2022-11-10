import 'package:xtra/xtra.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Test', () {
      Table table = Table();
      Column<String> stringBasedColumn = new Column<String>(table, "StringBasedColumn");

      stringBasedColumn.add("test");
      expect(stringBasedColumn[0], "test");

      stringBasedColumn[0] = "test 2";
      expect(stringBasedColumn[0], "test 2");

      stringBasedColumn.add("test");
      expect(stringBasedColumn[1], "test");
    });
  });
}

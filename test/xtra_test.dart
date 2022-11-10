import 'package:xtra/xtra.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Test', () {
      Table table = Table();
      Column<String> stringBasedColumn = new Column<String>(table, "StringBasedColumn", "Default");
      stringBasedColumn.add("test");
      print(stringBasedColumn[0]);
      expect(true, isTrue);
    });
  });
}

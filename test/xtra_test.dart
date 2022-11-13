import 'package:xtra/xtra.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Test', () {
      Table table = Table("MyTable");
      Column autoInc = table.addColumn("AutoIncColumn", autoInc: true);
      Column stringBased = table.addColumn("StringBasedColumn");

      table.addRow({"StringBasedColumn": "Hello"});

      print(table.rows[0]["AutoIncColumn"]);
      print(table.rows[0]["StringBasedColumn"]);
    });
  });
}

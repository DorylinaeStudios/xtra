import 'package:xtra/xtra.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Test', () {
      Table table = Table("MyTable");

      table.addColumn("Index", int, autoInc: true);
      table.addColumn("First Name", String);
      table.addColumn("Last Name", String);
      table.addColumn("E-Mail", String);

      table.addRow({
        "First Name": "John",
        "Last Name": "Doe",
        "E-Mail": "johndoe@example.email"
      });

      table.addRow({
        "First Name": "Jane",
        "Last Name": "Doe",
        "E-Mail": "janedoe@example.email"
      });
    });
  });
}

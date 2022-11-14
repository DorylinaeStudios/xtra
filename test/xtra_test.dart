import 'package:xtra/xtra.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Test', () {
      XTable table = XTable("MyXTable");

      table.addXColumn("Index", int, autoInc: true);
      table.addXColumn("First Name", String);
      table.addXColumn("Last Name", String);
      table.addXColumn("E-Mail", String);

      table.addXRow({
        "First Name": "John",
        "Last Name": "Doe",
        "E-Mail": "johndoe@example.email"
      });

      table.addXRow({
        "First Name": "Jane",
        "Last Name": "Doe",
        "E-Mail": "janedoe@example.email"
      });
    });
  });
}

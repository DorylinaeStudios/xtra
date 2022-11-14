import 'package:xtra/xtra.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Test', () {
      XSet xSet = XSet("MyXSet");

      xSet.addXTable("MyXTable");

      xSet.xTables["MyXTable"].addXColumn("Index", int, autoInc: true);
      xSet.xTables["MyXTable"].addXColumn("First Name", String);
      xSet.xTables["MyXTable"].addXColumn("Last Name", String);

      xSet.xTables["MyXTable"]
          .addXRow({"First Name": "John", "Last Name": "Doe"});

      expect(xSet.xTables["MyXTable"].xRows[0].toString(),
          "{Index: 0, First Name: John, Last Name: Doe}");
    });
  });
}

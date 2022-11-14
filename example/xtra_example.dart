import 'package:xtra/xtra.dart';

void main() {
  simple();
}

void simple() {
  XSet xSet = XSet("MyXSet");

  xSet.addXTable("MyXTable");

  xSet.xTables["MyXTable"].addXColumn("Index", int, autoInc: true);
  xSet.xTables["MyXTable"].addXColumn("First Name", String);
  xSet.xTables["MyXTable"].addXColumn("Last Name", String);

  xSet.xTables["MyXTable"].addXRow({"First Name": "John", "Last Name": "Doe"});

  print(xSet.xTables["MyXTable"].xRows[0]);
}

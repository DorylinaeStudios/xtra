import 'package:xtra/xtra.dart';

void main() {
  simple();
}

void simple() {
  XSet xSet = XSet("MyXSet");

  xSet.addXTable("MyXTable");

  xSet.tables["MyXTable"].addXColumn("Index", int, autoInc: true);
  xSet.tables["MyXTable"].addXColumn("First Name", String);
  xSet.tables["MyXTable"].addXColumn("Last Name", String);

  xSet.tables["MyXTable"].addXRow({"First Name": "John", "Last Name": "Doe"});

  print(xSet.tables["MyXTable"].rows[0]);
}

import 'package:xtra/xtra.dart';

void main() {
  XSet xSet = XSet("MyXset");

  xSet.addXTable("MyXTable");

  xSet.tables["MyXTable"].addXColumn("Index", int, autoInc: true);
  xSet.tables["MyXTable"].addXColumn("First Name", String);
  xSet.tables["MyXTable"].addXColumn("Last Name", String);
  xSet.tables["MyXTable"].addXColumn("E-Mail", String);

  xSet.tables["MyXTable"].addXRow({
    "First Name": "John",
    "Last Name": "Doe",
    "E-Mail": "johndoe@example.email"
  });

  xSet.tables["MyXTable"].addXRow({
    "First Name": "Jane",
    "Last Name": "Doe",
    "E-Mail": "janedoe@example.email"
  });

  print(xSet.tables["MyXTable"].rows[0]);

  print(xSet.tables["MyXTable"].rows[1]);

  print(xSet.tables["MyXTable"].rows[0]["First Name"].runtimeType);

  print(xSet.tables["MyXTable"].rows[0]["First Name"]);
  print(xSet.tables["MyXTable"].rows[1]["First Name"]);

  xSet.tables["MyXTable"].rows[0]["First Name"] = "Name";

  print(xSet.tables["MyXTable"].rows[0]);
}

import 'package:xtra/xtra.dart';

void main() {
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

  print(table.rows[0]);

  print(table.rows[1]);

  print(table.rows[0]["First Name"].runtimeType);

  print(table.rows[0]["First Name"]);
  print(table.rows[1]["First Name"]);

  table.rows[0]["First Name"] = "Name";

  print(table.rows[0]);
}

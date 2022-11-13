import 'package:xtra/xtra.dart';

void main() {
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

  print(table.rows[0]);

  print(table.rows[1]);

  print(table.rows[0]["First Name"]);
  print(table.rows[1]["First Name"]);

  table.rows[0]["First Name"] = "Name";

  print(table.rows[0]);
}

import 'package:xtra/xtra.dart';

void main() {
  Table table = Table("MyTable");
  Column autoInc = table.addColumn("AutoIncColumn", autoInc : true);
  Column stringBased = table.addColumn("StringBasedColumn");

  table.addRow();

  print(table.columns[0].columnName);
}

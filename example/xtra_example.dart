import 'package:xtra/xtra.dart';

void main() {
  Table table = Table();
  Column<int> autoIncColumn = new Column<int>(table, "StringBasedColumn", autoInc : true);

  autoIncColumn.add();
  autoIncColumn.add();
  print(autoIncColumn[1]);
}

import 'package:xtra/xtra.dart';

void main() {
  Column<int> autoIncColumn = Column<int>("AutoIncColumn", autoInc : true);

  autoIncColumn.add();
  autoIncColumn.add();
  print(autoIncColumn[1]); // returns 1

  Column<String> stringBasedColumn = Column<String>("StringBasedColumn");

  stringBasedColumn.add("test");
  print(stringBasedColumn[0]); // returns test

  stringBasedColumn[0] = "test 2";
  print(stringBasedColumn[0]); // returns test 2

  stringBasedColumn.add("test");
  print(stringBasedColumn[1]); // returns test
}

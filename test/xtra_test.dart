import 'package:xtra/xtra.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Test', () {
      Column<int> autoIncColumn = Column<int>("AutoIncColumn", autoInc : true);

      autoIncColumn.add();
      autoIncColumn.add();
      expect(autoIncColumn[1], 1); // returns 1

      Column<String> stringBasedColumn = Column<String>("StringBasedColumn");

      stringBasedColumn.add("test");
      expect(stringBasedColumn[0], "test");

      stringBasedColumn[0] = "test 2";
      expect(stringBasedColumn[0], "test 2");

      stringBasedColumn.add("test");
      expect(stringBasedColumn[1], "test");
    });
  });
}

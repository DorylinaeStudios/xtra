[![Dart](https://github.com/DorylinaeStudios/xtra/actions/workflows/dart.yml/badge.svg?branch=alpha)](https://github.com/DorylinaeStudios/xtra/actions/workflows/dart.yml)

Some xtra useful datatypes. Currently in development.

Implemented Datatypes:
- XSet, emulates a database, holds collection of tables
- XTable, emulates a database table
- XColumn, used by XTable to represent Columns
- XRow, used by XTable to represent Rows

## Usage

```dart
XSet xSet = XSet("MyXSet");

xSet.addXTable("MyXTable");

xSet.tables["MyXTable"].addXColumn("Index", int, autoInc: true);
xSet.tables["MyXTable"].addXColumn("First Name", String);
xSet.tables["MyXTable"].addXColumn("Last Name", String);

xSet.tables["MyXTable"].addXRow({"First Name": "John", "Last Name": "Doe"});

print(xSet.tables["MyXTable"].rows[0]);
```
Output:
```{Index: 0, First Name: John, Last Name: Doe}```

## Additional information

Currently maintained by Dorylinae Studios™

Contact: dorylinae.studios@gmail.com

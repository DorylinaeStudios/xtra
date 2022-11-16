import 'dart:io';

import 'package:xtra/xtra.dart';

void main() {
  // Create XSet which will hold a collection on XTables.
  XSet xSet = XSet("MyXSet");

  simple(xSet);
  fromXml(xSet);
}

void simple(XSet xSet) {
  // Creates, links, and adds new XTable to xSet
  xSet.addXTable("Simple");

  // Creates, links, and adds XColumns to xSet
  xSet.xTables["Simple"].addXColumn("Index", int, autoInc: true);
  xSet.xTables["Simple"].addXColumn("First Name", String);
  xSet.xTables["Simple"].addXColumn("Last Name", String);

  // Adds a new row
  xSet.xTables["Simple"].addXRow({"First Name": "John", "Last Name": "Doe"});

  print(xSet.xTables["Simple"].xRows[0]); // Out: {Index: 0, First Name: John, Last Name: Doe}
  print(xSet.xTables["Simple"].xRows[0]["First Name"]); // Out: John

  print(xSet.xTables["Simple"]);
}

void fromXml(XSet xSet) {
  xSet.addXTable("FromXml");

  final String xml = File('test_data/species.xml').readAsStringSync();

  xSet.xTables["FromXml"].fromXml(xml);

  print(xSet.xTables["FromXml"]);
  print("The base card cost is ${double.parse(xSet.xTables["FromXml"].xRows[13]["BaseCarbCost"])}");
}

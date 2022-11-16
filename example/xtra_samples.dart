import 'dart:io';
import 'package:xtra/xtra.dart';

class Samples {
  XSet xSet = XSet("MyXSet");

  void simple() {
    // Creates, links, and adds new XTable to xSet
    xSet.addXTable("Simple");

    // Creates, links, and adds new XColumns to xTable
    xSet.xTables["Simple"].addXColumn("Index", int, autoInc: true);
    xSet.xTables["Simple"].addXColumn("First Name", String);
    xSet.xTables["Simple"].addXColumn("Last Name", String);

    // Creates, links, and adds new XRows to xTable
    xSet.xTables["Simple"].addXRow({"First Name": "John", "Last Name": "Doe"});
    xSet.xTables["Simple"].addXRow({"First Name": "Jane", "Last Name": "Doe"});
  }

  void fromXml() {
    // Creates, links, and adds new XTable to xSet
    xSet.addXTable("FromXml");

    // Gets xml from file as String
    final String xml = File('test_data/species.xml').readAsStringSync();

    // Imports xml into table
    xSet.xTables["FromXml"].fromXml(xml);
  }
}

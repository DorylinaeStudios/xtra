import 'package:xtra/xtra.dart';

class Samples() {
  XSet xSet = XSet();


  void simple(XSet xSet) {
    // Creates, links, and adds new XTable to xSet
    xSet.addXTable("Simple");

    // Creates, links, and adds XColumns to xSet
    xSet.xTables["Simple"].addXColumn("Index", int, autoInc: true);
    xSet.xTables["Simple"].addXColumn("First Name", String);
    xSet.xTables["Simple"].addXColumn("Last Name", String);

    // Add rows
    xSet.xTables["Simple"].addXRow({"First Name": "John", "Last Name": "Doe"});
    xSet.xTables["Simple"].addXRow({"First Name": "Jane", "Last Name": "Doe"});
  }

  void fromXml(XSet xSet) {
    // Creates, links, and adds new XTable to xSet
    xSet.addXTable("FromXml");

    // Gets xml from file as String
    final String xml = File('test_data/species.xml').readAsStringSync();

    // Imports xml into table
    xSet.xTables["FromXml"].fromXml(xml);
  }
}

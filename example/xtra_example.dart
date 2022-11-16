import 'dart:io';
import 'package:xtra/xtra.dart';
import 'example/xtra_samples.dart';

void main() {
  // Create XSet which will hold a collection on XTables.
  XSet xSet = XSet("MyXSet");

  simple(xSet);
  fromXml(xSet);
}

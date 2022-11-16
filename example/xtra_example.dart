import 'package:xtra/xtra.dart';
import 'xtra_samples.dart';

void main() {
  // Create XSet which will hold a collection on XTables.
  Samples samples = Samples();

  samples.simple();
  print(samples.xSet.xTables["Simple"]);

  samples.fromXml();
  print(samples.xSet.xTables["FromXml"].xColumns);

  print(samples.xSet.xTables["FromXml"].xColumns["Species"]);
}

import 'package:test/test.dart';
import '../example/xtra_samples.dart';

void main() {
  Samples samples = Samples();

  group('Main Tests', () {
    test('Simple', () {
      String expected = "Jane";

      samples.simple();
      expect(samples.xSet.xTables["Simple"].xRows[1]["First Name"], expected);
    });

    test('FromXml', () {
      String expected = "Green-head Ant";

      samples.fromXml();
      expect(samples.xSet.xTables["FromXml"].xRows[13]["CommonName"], expected);
    });
  });
}

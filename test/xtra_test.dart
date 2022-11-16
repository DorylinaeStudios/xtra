import 'package:xtra/xtra.dart';
import 'package:test/test.dart';
import 'xtra_samples.dart';

void main() {
  Samples samples = Samples();
  group('Main Tests', () {
    test('Simple', () {
      samples.simple();
      print(samples.xSet["Simple"]);
    });

    test('FromXml', () {
      samples.fromXml();
      print(samples.xSet["FromXml"]);
    });
  });
}

import 'package:intl_country_data/intl_country_data.dart';
import 'package:test/test.dart';

void main() {
  group('Finding countries', () {
    test('Find US by country code', () {
      final countries = IntlCountryData.fromCountryCodeAlpha2('us');
      expect(countries.codeAlpha2, equals('US'));
    });
  });
  group('Telephone', () {
    test('Test a valid GB telephone number', () {
      final countries = IntlCountryData.fromTelephoneNumber('+447777666555');
      final gbCountry = countries.where((c) => c.codeAlpha2 == 'GB');
      expect(countries, isNotEmpty);
      expect(gbCountry, isNotEmpty);
      expect(gbCountry.length, equals(1));
    });
  });
}

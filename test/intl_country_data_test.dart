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

  group('Area Codes', () {
    test('Country Test: Canada', () {
      final countries = IntlCountryData.fromTelephoneNumber('+12361111111');
      final country = countries.where((c) => c.codeAlpha2 == 'CA');
      expect(countries, isNotEmpty);
      expect(country, isNotEmpty);
      expect(country.length, equals(1));
    });
    test('Country Test: United States', () {
      final countries = IntlCountryData.fromTelephoneNumber('+13461111111');
      final country = countries.where((c) => c.codeAlpha2 == 'US');
      expect(countries, isNotEmpty);
      expect(country, isNotEmpty);
      expect(country.length, equals(1));
      if (country.isNotEmpty) {
        expect(country.first.matchingTelephoneAreaCode('+13461111111'),
            equals('Texas'));
      }
    });

    test('Country Test: Jamaica', () {
      final countries = IntlCountryData.fromTelephoneNumber('+18761111111');
      final country = countries.where((c) => c.codeAlpha2 == 'JM');
      expect(countries, isNotEmpty);
      expect(country, isNotEmpty);
      expect(country.length, equals(1));
    });

    test('Country Test: Namibia', () {
      final countries = IntlCountryData.fromTelephoneNumber('+264111111111');
      expect(countries, isNotEmpty);
      expect(countries.length, equals(1));
      if (countries.length == 1) {
        expect(countries.first.codeAlpha2, equals('NA'));
      }
    });

    test('Country Test: Belarus', () {
      final countries = IntlCountryData.fromTelephoneNumber('+375111111111');
      expect(countries, isNotEmpty);
      expect(countries.length, equals(1));
      if (countries.length == 1) {
        expect(countries.first.codeAlpha2, equals('BY'));
      }
    });

    test('Country Test: Madagascar', () {
      final countries = IntlCountryData.fromTelephoneNumber('+261111111111');
      expect(countries, isNotEmpty);
      expect(countries.length, equals(1));
      if (countries.length == 1) {
        expect(countries.first.codeAlpha2, equals('MG'));
      }
    });
  });
}

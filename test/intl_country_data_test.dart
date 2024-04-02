import 'package:intl_country_data/intl_country_data.dart';
import 'package:test/test.dart';

// A fake telephone number (Starts with 1 and counts up)
String fakeNsn(int length) =>
    List.generate(length, (index) => 0 + (index + 1) % 10).join();

void main() {
  group('Finding countries', () {
    test('Find US by country code', () {
      final countries = IntlCountryData.fromCountryCodeAlpha2('us');
      expect(countries.codeAlpha2, equals('US'));
    });
  });
  group('Telephone', () {
    test('Test a valid GB telephone number', () {
      final countries =
          IntlCountryData.fromTelephoneNumber('+44${fakeNsn(10)}');
      final gbCountry = countries.where((c) => c.codeAlpha2 == 'GB');
      expect(countries, isNotEmpty);
      expect(gbCountry, isNotEmpty);
      expect(gbCountry.length, equals(1));
    });
  });

  group('Area Codes', () {
    test('Country Test: Canada', () {
      final countries =
          IntlCountryData.fromTelephoneNumber('+1236${fakeNsn(7)}');
      final country = countries.where((c) => c.codeAlpha2 == 'CA');
      expect(countries, isNotEmpty);
      expect(country, isNotEmpty);
      expect(country.length, equals(1));
    });
    test('Country Test: United States', () {
      final countries =
          IntlCountryData.fromTelephoneNumber('+1346${fakeNsn(7)}');
      final country = countries.where((c) => c.codeAlpha2 == 'US');
      expect(countries, isNotEmpty);
      expect(country, isNotEmpty);
      expect(country.length, equals(1));
      if (country.isNotEmpty) {
        expect(country.first.matchingTelephoneAreaCode('+1346${fakeNsn(7)}'),
            equals('Texas'));
      }
    });

    test('Country Test: Jamaica', () {
      final countries =
          IntlCountryData.fromTelephoneNumber('+1876${fakeNsn(7)}');
      final country = countries.where((c) => c.codeAlpha2 == 'JM');
      expect(countries, isNotEmpty);
      expect(country, isNotEmpty);
      expect(country.length, equals(1));
    });

    test('Country Test: Namibia', () {
      final countries =
          IntlCountryData.fromTelephoneNumber('+264${fakeNsn(9)}');
      expect(countries, isNotEmpty);
      expect(countries.length, equals(1));
      if (countries.length == 1) {
        expect(countries.first.codeAlpha2, equals('NA'));
      }
    });

    test('Country Test: Belarus', () {
      final countries =
          IntlCountryData.fromTelephoneNumber('+375${fakeNsn(9)}');
      expect(countries, isNotEmpty);
      expect(countries.length, equals(1));
      if (countries.length == 1) {
        expect(countries.first.codeAlpha2, equals('BY'));
      }
    });

    test('Country Test: Madagascar', () {
      final countries =
          IntlCountryData.fromTelephoneNumber('+261${fakeNsn(9)}');
      expect(countries, isNotEmpty);
      expect(countries.length, equals(1));
      if (countries.length == 1) {
        expect(countries.first.codeAlpha2, equals('MG'));
      }
    });

    test('Country Test: Kenya', () {
      final countries =
          IntlCountryData.fromTelephoneNumber('+254${fakeNsn(9)}');
      expect(countries, isNotEmpty);
      expect(countries.length, equals(1));
      if (countries.length == 1) {
        expect(countries.first.codeAlpha2, equals('KE'));
      }
    });
  });

  test('Country Test: New Zealand', () {
    final countries9digit =
        IntlCountryData.fromTelephoneNumber('+64${fakeNsn(9)}');
    expect(countries9digit, isNotEmpty);
    expect(countries9digit.length, equals(1));
    if (countries9digit.length == 1) {
      expect(countries9digit.first.codeAlpha2, equals('NZ'));
    }
    final countries10digit =
        IntlCountryData.fromTelephoneNumber('+64${fakeNsn(10)}');
    expect(countries10digit, isNotEmpty);
    expect(countries10digit.length, equals(1));
    if (countries10digit.length == 1) {
      expect(countries10digit.first.codeAlpha2, equals('NZ'));
    }
  });

  test('Country Test: Pitcairn', () {
    final countries = IntlCountryData.fromTelephoneNumber('+64${fakeNsn(8)}');
    expect(countries, isNotEmpty);
    expect(countries.length, equals(1));
    if (countries.length == 1) {
      expect(countries.first.codeAlpha2, equals('PN'));
    }
  });
  test('Country Test: Croatia', () {
    final countries = IntlCountryData.fromTelephoneNumber('+385${fakeNsn(9)}');
    expect(countries, isNotEmpty);
    expect(countries.length, equals(1));
    if (countries.length == 1) {
      expect(countries.first.codeAlpha2, equals('HR'));
    }
  });
  test('Country Test: Ghana', () {
    final countries = IntlCountryData.fromTelephoneNumber('+233${fakeNsn(9)}');
    expect(countries, isNotEmpty);
    expect(countries.length, equals(1));
    if (countries.length == 1) {
      expect(countries.first.codeAlpha2, equals('GH'));
    }
  });
  test('Country Test: Bosnia and Herzegovina', () {
    final countries8 = IntlCountryData.fromTelephoneNumber('+387${fakeNsn(8)}');
    expect(countries8, isNotEmpty);
    expect(countries8.length, equals(1));
    if (countries8.length == 1) {
      expect(countries8.first.codeAlpha2, equals('BA'));
    }
    final countries9 = IntlCountryData.fromTelephoneNumber('+387${fakeNsn(9)}');
    expect(countries9, isNotEmpty);
    expect(countries9.length, equals(1));
    if (countries9.length == 1) {
      expect(countries9.first.codeAlpha2, equals('BA'));
    }
  });
  test('Country Test: Austria', () {
    final countriesShort =
        IntlCountryData.fromTelephoneNumber('+43${fakeNsn(3)}');
    expect(countriesShort, isNotEmpty);
    expect(countriesShort.length, equals(1));
    if (countriesShort.length == 1) {
      expect(countriesShort.first.codeAlpha2, equals('AT'));
    }
    final countriesLong =
        IntlCountryData.fromTelephoneNumber('+43${fakeNsn(12)}');
    expect(countriesLong, isNotEmpty);
    expect(countriesLong.length, equals(1));
    if (countriesLong.length == 1) {
      expect(countriesLong.first.codeAlpha2, equals('AT'));
    }
  });
  test('Country Test: Lebanon', () {
    final countriesShort =
        IntlCountryData.fromTelephoneNumber('+961${fakeNsn(7)}');
    expect(countriesShort, isNotEmpty);
    expect(countriesShort.length, equals(1));
    if (countriesShort.length == 1) {
      expect(countriesShort.first.codeAlpha2, equals('LB'));
    }
    final countriesLong =
        IntlCountryData.fromTelephoneNumber('+961${fakeNsn(8)}');
    expect(countriesLong, isNotEmpty);
    expect(countriesLong.length, equals(1));
    if (countriesLong.length == 1) {
      expect(countriesLong.first.codeAlpha2, equals('LB'));
    }
  });

  test('Country Test: Indonesia', () {
    final countriesShort =
        IntlCountryData.fromTelephoneNumber('+62${fakeNsn(7)}');
    expect(countriesShort, isNotEmpty);
    expect(countriesShort.length, equals(1));
    if (countriesShort.length == 1) {
      expect(countriesShort.first.codeAlpha2, equals('ID'));
    }
    final countriesLong =
        IntlCountryData.fromTelephoneNumber('+62${fakeNsn(13)}');
    expect(countriesLong, isNotEmpty);
    expect(countriesLong.length, equals(1));
    if (countriesLong.length == 1) {
      expect(countriesLong.first.codeAlpha2, equals('ID'));
    }
  });
  test('Country Test: Luxembourg', () {
    final countries = IntlCountryData.fromTelephoneNumber('+352${fakeNsn(9)}');
    expect(countries, isNotEmpty);
    expect(countries.length, equals(1));
    if (countries.length == 1) {
      expect(countries.first.codeAlpha2, equals('LU'));
    }
  });

  test('Country Test: Finland', () {
    final countries = IntlCountryData.fromTelephoneNumber('+358${fakeNsn(9)}');
    expect(countries, isNotEmpty);
    expect(countries.length, equals(1));
    if (countries.length == 1) {
      expect(countries.first.codeAlpha2, equals('FI'));
    }
  });
}

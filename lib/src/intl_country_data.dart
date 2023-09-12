import 'data.dart';

class CountryNotFoundException implements Exception {}

class IntlCountryData {
  /// Name (English)
  final String name;

  /// Translations of name in various languages
  final Map<String, String> nameTranslations;

  /// Flag emoji
  final String flag;

  /// 2 letter country code (ISO 3166-1 alpha-2)
  /// https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
  final String codeAlpha2;

  /// Telephone number dial code
  final String telephoneCode;

  /// Telephone number minimum length
  final int telephoneMinLength;

  /// Telephone number maximum length
  final int telephoneMaxLength;

  const IntlCountryData({
    required this.name,
    required this.flag,
    required this.codeAlpha2,
    required this.telephoneCode,
    required this.nameTranslations,
    required this.telephoneMinLength,
    required this.telephoneMaxLength,
  });

  /// Returns a country for a given 2 letter country code.
  /// Throws a [StateError] if not found.
  factory IntlCountryData.fromCountryCodeAlpha2(String code) =>
      countries.firstWhere((c) => c.codeAlpha2 == code.toUpperCase());

  /// Returns all countries
  static List<IntlCountryData> all() => countries;

  /// Returns countries that match this telephone number format
  static List<IntlCountryData> fromTelephoneNumber(String number) => countries
      .where((c) =>
          number.substring(1, c.telephoneCode.length + 1) == c.telephoneCode &&
          number.length >= c.telephoneMinLength + c.telephoneCode.length + 1 &&
          number.length <= c.telephoneMaxLength + c.telephoneCode.length + 1)
      .toList();

  String localizedName(String languageCode) {
    return nameTranslations[languageCode] ?? name;
  }
}

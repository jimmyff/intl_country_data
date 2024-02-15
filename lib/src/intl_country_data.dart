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

  /// State/Province and list of area codes. Optional. This is useful to
  /// determine country of a number in overlapping country eg: US & CA
  final Map<String, List<int>>? telephoneAreaCodes;

  const IntlCountryData({
    required this.name,
    required this.flag,
    required this.codeAlpha2,
    required this.telephoneCode,
    required this.nameTranslations,
    required this.telephoneMinLength,
    required this.telephoneMaxLength,
    this.telephoneAreaCodes,
  });

  /// Returns a country for a given 2 letter country code.
  /// Throws a [StateError] if not found.
  factory IntlCountryData.fromCountryCodeAlpha2(String code) =>
      countries.firstWhere((c) => c.codeAlpha2 == code.toUpperCase());

  static bool hasCountryCodeAlpha2(String code) =>
      countries.where((c) => c.codeAlpha2 == code.toUpperCase()).isNotEmpty;

  /// Returns all countries
  static List<IntlCountryData> all() => countries;

  /// Returns countries that match this telephone number format
  static List<IntlCountryData> fromTelephoneNumber(String number) {
    final matchingCountries = countries
        .where((c) =>
            number.substring(1, c.telephoneCode.length + 1) ==
                c.telephoneCode &&
            number.length >=
                c.telephoneMinLength + c.telephoneCode.length + 1 &&
            number.length <= c.telephoneMaxLength + c.telephoneCode.length + 1)
        .toList();

    if (matchingCountries.length <= 1) return matchingCountries;
    // If there are more than 1 matching country then try to check area codes:

    List<IntlCountryData> checkedAreaCodes = [];
    for (var country in matchingCountries) {
      if (country.telephoneAreaCodes != null) {
        final areaCode = country.matchingTelephoneAreaCode(number);
        if (areaCode != null) {
          return [country];
        } else {
          checkedAreaCodes.add(country);
        }
      }
    }
    // If we can deduce which countries it isn't and we still have a result
    if (matchingCountries.length > checkedAreaCodes.length) {
      return matchingCountries
        ..removeWhere((c) => checkedAreaCodes.contains(c));
    }
    // Otherwise return original matches
    return matchingCountries;
  }

  String? matchingTelephoneAreaCode(String number) {
    final numberWithoutCode = number.substring(telephoneCode.length + 1);
    if (telephoneAreaCodes == null) return null;
    for (var area in telephoneAreaCodes!.keys) {
      // Need to itterate over ever code in order to support variable
      for (var code in telephoneAreaCodes![area]!) {
        if (numberWithoutCode.startsWith('$code')) return area;
      }
    }
    return null;
  }

  String localizedName(String languageCode) {
    return nameTranslations[languageCode] ?? name;
  }
}

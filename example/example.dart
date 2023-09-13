import 'package:intl_country_data/intl_country_data.dart';

void main() {
  // Load all countries
  final all = IntlCountryData.all();
  print('Loaded ${all.length} countries: ${all.map((e) => e.name).join(', ')}');

  // Load the UK
  final country = IntlCountryData.fromCountryCodeAlpha2('GB');
  print('Loaded ${country.name} ${country.flag}! '
      'Also known as: ${country.nameTranslations.values.join(', ')}');

  // Find matching countries for a given telephone number
  final matching = IntlCountryData.fromTelephoneNumber('+447777666555');
  print('Found ${matching.length} countries for this phone number: '
      '${matching.map((e) => e.name).join(',')}');
}

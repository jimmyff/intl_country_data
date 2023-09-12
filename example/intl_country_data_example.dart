import 'package:intl_country_data/intl_country_data.dart';

void main() {
  // Load all countries
  final all = IntlCountryData.all();
  print('Loaded ${all.length} countries: ${all.map((e) => e.name).join(', ')}');

  // Load the UK
  final unitedKingdom = IntlCountryData.fromCountryCodeAlpha2('GB');
  print('Loaded ${unitedKingdom} ${unitedKingdom.flag}! '
      'Also known as: ${unitedKingdom.nameTranslations.values.join(', ')}');

  // Find matching countries for a given telephone number
  final matchingCountries =
      IntlCountryData.fromTelephoneNumber('+447777666555');
  print('Found ${matchingCountries.length} countries for this phone number');
}

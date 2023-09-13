
# intl_country_data

A library for providing country data which can be used by both apps and other packages. The data originally came from the [intl_phone_field](https://pub.dev/packages/intl_phone_field) package. I used this package in a production app and discovered numerous errors in the data which I've fixed however have been waiting for merge for a long time. I also required access to this country data from a server environment, so separating the data from the original flutter package would make this possible as well as making the data more maintainable.

## Country data

|   Type   |   Name  |     Description      |
| ------------- | ------------- | ------------- |
| `String`  | Name  | English name |
| `Map<String, String>`  | nameTranslations  | Name translated in to various languages  |
| `String`  | flag  | Emoji flag |
| `String`  | codeAlpha2  | 2 letter country code (upper case) |
| `String`  | telephoneCode  | Dialing code for country |
| `int`  | telephoneMinLength  | Minimum length of a telephone number |
| `int`  | telephoneMaxLength  | Maximum length of a telephone number |

I'm planning to expand the data in the future, if you have specific ideas or requirements please get in touch.

## Example usage

```dart
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
```

## Data sources

The majority of data has been sourced from [Wikipedia](https://www.wikipedia.org/).

## Maintainers

I'm looking for assistance maintaining this repository.

- [jimmyff](https://github.com/jimmyff)

## Contributors

If you have contributed to this package you can include your name here and a link to your github profile.

- Numerous contributors of [intl_phone_field](https://pub.dev/packages/intl_phone_field)
- [jimmyff](https://github.com/jimmyff)

import 'package:fhir_client/models/value_sets/value_set_concept.dart';

const languageUri = 'urn:ietf:bcp:47';

/// A human language.
enum Language with ValueSetConcept<Language> {
  /// Arabic
  ar(
    code: 'ar',
    display: 'Arabic',
  ),

  /// Bengali
  bn(
    code: 'bn',
    display: 'Bengali',
  ),

  /// Czech
  cs(
    code: 'cs',
    display: 'Czech',
  ),

  /// Danish
  da(
    code: 'da',
    display: 'Danish',
  ),

  /// German
  de(
    code: 'de',
    display: 'German',
  ),

  /// Greek
  el(
    code: 'el',
    display: 'Greek',
  ),

  /// English
  en(
    code: 'en',
    display: 'English',
  ),

  /// Spanish
  es(
    code: 'es',
    display: 'Spanish',
  ),

  /// Finnish
  fi(
    code: 'fi',
    display: 'Finnish',
  ),

  /// French
  fr(
    code: 'fr',
    display: 'French',
  ),

  /// Gujarati
  gu(
    code: 'gu',
    display: 'Gujarati',
  ),

  /// Hindi
  hi(
    code: 'hi',
    display: 'Hindi',
  ),

  /// Croatian
  hr(
    code: 'hr',
    display: 'Croatian',
  ),

  /// Italian
  it(
    code: 'it',
    display: 'Italian',
  ),

  /// Japanese
  ja(
    code: 'ja',
    display: 'Japanese',
  ),

  /// Korean
  ko(
    code: 'ko',
    display: 'Korean',
  ),

  /// Dutch
  nl(
    code: 'nl',
    display: 'Dutch',
  ),

  /// Norwegian
  no(
    code: 'no',
    display: 'Norwegian',
  ),

  /// Punjabi
  pa(
    code: 'pa',
    display: 'Punjabi',
  ),

  /// Polish
  pl(
    code: 'pl',
    display: 'Polish',
  ),

  /// Portuguese
  pt(
    code: 'pt',
    display: 'Portuguese',
  ),

  /// Russian
  ru(
    code: 'ru',
    display: 'Russian',
  ),

  /// Swedish
  sv(
    code: 'sv',
    display: 'Swedish',
  ),

  /// Telugu
  te(
    code: 'te',
    display: 'Telugu',
  ),

  /// Chinese
  zh(
    code: 'zh',
    display: 'Chinese',
  );

  const Language({
    required this.code,
    required this.display,
    // ignore: unused_element
    this.definition = '',
  });

  @override
  final String code;

  @override
  final String display;

  @override
  final String definition;

  /// Returns the language based on the string code, and returns null if
  /// no match is found
  static Language? fromCode(String code) => switch (code) {
        ('ar') => Language.ar,
        ('bn') => Language.bn,
        ('cs') => Language.cs,
        ('da') => Language.da,
        ('de') => Language.de,
        ('el') => Language.el,
        ('en') => Language.en,
        ('es') => Language.es,
        ('fi') => Language.fi,
        ('fr') => Language.fr,
        ('gu') => Language.gu,
        ('hi') => Language.hi,
        ('hr') => Language.hr,
        ('it') => Language.it,
        ('ja') => Language.ja,
        ('ko') => Language.ko,
        ('nl') => Language.nl,
        ('no') => Language.no,
        ('pa') => Language.pa,
        ('pl') => Language.pl,
        ('pt') => Language.pt,
        ('ru') => Language.ru,
        ('sv') => Language.sv,
        ('te') => Language.te,
        ('zh') => Language.zh,
        (_) => null,
      };
}

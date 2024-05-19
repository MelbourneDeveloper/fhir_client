import 'package:jayse/jayse.dart';

const languageUri = 'urn:ietf:bcp:47';

/// A human language.
enum Language implements Comparable<Language> {
  /// Arabic
  ar(
    code: 'ar',
    display: 'Arabic',
    system: languageUri,
  ),

  /// Bengali
  bn(
    code: 'bn',
    display: 'Bengali',
    system: languageUri,
  ),

  /// Czech
  cs(
    code: 'cs',
    display: 'Czech',
    system: languageUri,
  ),

  /// Danish
  da(
    code: 'da',
    display: 'Danish',
    system: languageUri,
  ),

  /// German
  de(
    code: 'de',
    display: 'German',
    system: languageUri,
  ),

  /// Greek
  el(
    code: 'el',
    display: 'Greek',
    system: languageUri,
  ),

  /// English
  en(
    code: 'en',
    display: 'English',
    system: languageUri,
  ),

  /// Spanish
  es(
    code: 'es',
    display: 'Spanish',
    system: languageUri,
  ),

  /// Finnish
  fi(
    code: 'fi',
    display: 'Finnish',
    system: languageUri,
  ),

  /// French
  fr(
    code: 'fr',
    display: 'French',
    system: languageUri,
  ),

  /// Gujarati
  gu(
    code: 'gu',
    display: 'Gujarati',
    system: languageUri,
  ),

  /// Hindi
  hi(
    code: 'hi',
    display: 'Hindi',
    system: languageUri,
  ),

  /// Croatian
  hr(
    code: 'hr',
    display: 'Croatian',
    system: languageUri,
  ),

  /// Italian
  it(
    code: 'it',
    display: 'Italian',
    system: languageUri,
  ),

  /// Japanese
  ja(
    code: 'ja',
    display: 'Japanese',
    system: languageUri,
  ),

  /// Korean
  ko(
    code: 'ko',
    display: 'Korean',
    system: languageUri,
  ),

  /// Dutch
  nl(
    code: 'nl',
    display: 'Dutch',
    system: languageUri,
  ),

  /// Norwegian
  no(
    code: 'no',
    display: 'Norwegian',
    system: languageUri,
  ),

  /// Punjabi
  pa(
    code: 'pa',
    display: 'Punjabi',
    system: languageUri,
  ),

  /// Polish
  pl(
    code: 'pl',
    display: 'Polish',
    system: languageUri,
  ),

  /// Portuguese
  pt(
    code: 'pt',
    display: 'Portuguese',
    system: languageUri,
  ),

  /// Russian
  ru(
    code: 'ru',
    display: 'Russian',
    system: languageUri,
  ),

  /// Swedish
  sv(
    code: 'sv',
    display: 'Swedish',
    system: languageUri,
  ),

  /// Telugu
  te(
    code: 'te',
    display: 'Telugu',
    system: languageUri,
  ),

  /// Chinese
  zh(
    code: 'zh',
    display: 'Chinese',
    system: languageUri,
  );

  const Language({
    required this.code,
    required this.display,
    required this.system,
  });

  final String code;
  final String display;
  final String system;

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

  JsonValue get json => JsonString(code);

  @override
  int compareTo(Language other) => code == other.code ? 0 : 1;
}

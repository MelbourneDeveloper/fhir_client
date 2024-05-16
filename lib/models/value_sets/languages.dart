import 'package:jayse/jayse.dart';

const languageUri = 'urn:ietf:bcp:47';

/// A human language.
enum Languages implements Comparable<Languages> {
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

  const Languages({
    required this.code,
    required this.display,
    required this.system,
  });

  final String code;
  final String display;
  final String system;

  /// Returns the language based on the string code, and returns null if
  /// no match is found
  static Languages? fromCode(String code) => switch (code) {
        ('ar') => Languages.ar,
        ('bn') => Languages.bn,
        ('cs') => Languages.cs,
        ('da') => Languages.da,
        ('de') => Languages.de,
        ('el') => Languages.el,
        ('en') => Languages.en,
        ('es') => Languages.es,
        ('fi') => Languages.fi,
        ('fr') => Languages.fr,
        ('gu') => Languages.gu,
        ('hi') => Languages.hi,
        ('hr') => Languages.hr,
        ('it') => Languages.it,
        ('ja') => Languages.ja,
        ('ko') => Languages.ko,
        ('nl') => Languages.nl,
        ('no') => Languages.no,
        ('pa') => Languages.pa,
        ('pl') => Languages.pl,
        ('pt') => Languages.pt,
        ('ru') => Languages.ru,
        ('sv') => Languages.sv,
        ('te') => Languages.te,
        ('zh') => Languages.zh,
        (_) => null,
      };

  JsonValue get json => JsonString(code);

  @override
  int compareTo(Languages other) => code == other.code ? 0 : 1;
}

// ignore_for_file: lines_longer_than_80_chars

enum ValueSetStrength {
  example,
  preferred,
  extensible,
  required;

  static ValueSetStrength fromCode(String value) {
    switch (value) {
      case 'example':
        return ValueSetStrength.example;
      case 'preferred':
        return ValueSetStrength.preferred;
      case 'extensible':
        return ValueSetStrength.extensible;
      case 'required':
        return ValueSetStrength.required;
      default:
        throw ArgumentError('Unknown value: $value');
    }
  }
}

class Field {
  const Field({
    required this.name,
    required this.types,
    required this.dartType,
    required this.min,
    required this.max,
    required this.isMaxStar,
    required this.definition,
     this.valueSetStrength,
    this.isValueSet = false,
    this.allowedStringValues,
  });

  final String name;
  final String dartType;
  final List<String> types;
  final int min;
  final int? max;
  final bool isMaxStar;
  final List<String>? allowedStringValues;
  final String definition;
  final bool isValueSet;
  final ValueSetStrength? valueSetStrength;
}

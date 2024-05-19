// ignore_for_file: lines_longer_than_80_chars

class Field {
  const Field({
    required this.name,
    required this.types,
    required this.dartType,
    required this.min,
    required this.max,
    required this.isMaxStar,
    required this.definition,
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

  bool get isPrimitive =>
      types.length == 1 &&
      switch (dartType) {
        'String' => true,
        'bool' => true,
        'int' => true,
        'DateTime' => true,
        'Uri' => true,
        _ => false,
      };
}

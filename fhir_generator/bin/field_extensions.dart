// ignore_for_file: lines_longer_than_80_chars

import 'field.dart';

extension FieldExtensions on Field {
  String typeAndName() => '$dartType? $name';

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

extension FieldListExtensions on Iterable<Field> {
  Iterable<Field> whereNotInherited() => where(
        (field) => ![
          'meta',
          'id',
        ].contains(field.name),
      );
}

// ignore_for_file: lines_longer_than_80_chars

import 'field.dart';

extension FieldListExtensions on Iterable<Field> {
  Iterable<Field> whereNotInherited() => where(
        (field) => ![
          'meta',
          'id',
        ].contains(field.name),
      );
}

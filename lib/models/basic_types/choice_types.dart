import 'package:jayse/jayse.dart';

sealed class BooleanOrDateTimeChoice {
  BooleanOrDateTimeChoice._internal();

  static BooleanOrDateTimeChoice? fromJson(JsonValue json) {
    //TODO: clean this nastiness up. not dangerous, but nasty nonetheless
    if (json is! JsonString) return null;
    final value = (json.value as JsonString).value;
    if (value == 'true' || value == 'false') {
      return BoolChoice(value == 'true');
    } else {
      final parsedValue = DateTime.tryParse(value);
      if (parsedValue == null) return null;
      return DateTimeChoice(parsedValue);
    }
  }

  JsonString toJsonString();
}

sealed class BooleanOrIntegerChoice {
  BooleanOrIntegerChoice._internal();

  static BooleanOrIntegerChoice? fromJson(JsonValue json) {
    if (json is JsonBoolean) {
      return BoolChoice(json.value);
    } else if (json is JsonNumber) {
      return IntegerChoice(json.value.toInt());
    }
    return null;
  }
}

final class IntegerChoice extends BooleanOrIntegerChoice {
  IntegerChoice(this.value) : super._internal();

  final int value;

  JsonValue toJson() => JsonNumber(value);
}

final class BoolChoice extends BooleanOrDateTimeChoice
    implements BooleanOrIntegerChoice {
  BoolChoice(this.value) : super._internal();

  final bool value;

  @override
  JsonString toJsonString() => JsonString(value.toString());
}

final class DateTimeChoice extends BooleanOrDateTimeChoice {
  DateTimeChoice(this.value) : super._internal();

  final DateTime value;

  @override
  JsonString toJsonString() => JsonString(value.toIso8601String());
}

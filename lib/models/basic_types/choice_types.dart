import 'package:jayse/jayse.dart';

sealed class BoolOrDateTimeChoice {
  BoolOrDateTimeChoice._internal();

  static BoolOrDateTimeChoice? fromJson(JsonValue json) {
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

final class BoolChoice extends BoolOrDateTimeChoice {
  BoolChoice(this.value) : super._internal();

  final bool value;

  @override
  JsonString toJsonString() => JsonString(value.toString());
}

final class DateTimeChoice extends BoolOrDateTimeChoice {
  DateTimeChoice(this.value) : super._internal();

  final DateTime value;

  @override
  JsonString toJsonString() => JsonString(value.toIso8601String());
}

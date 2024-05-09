// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/time.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/range.dart';
import 'package:jayse/jayse.dart';

/// A set of rules that describe when the event should occur.
class Repeat {

  /// Constructs a new [Repeat].
  Repeat({
    Duration? boundsDuration,
    Range? boundsRange,
    Period? boundsPeriod,
    int? count,
    int? countMax,
    num? duration,
    num? durationMax,
    String? durationUnit,
    int? frequency,
    int? frequencyMax,
    num? period,
    num? periodMax,
    String? periodUnit,
    FixedList<String>? dayOfWeek,
    FixedList<Time>? timeOfDay,
    FixedList<String>? when,
    int? offset,
  }) : this.fromJson(
          JsonObject({
            if (boundsDuration != null)
              boundsDurationField.name:
                  JsonNumber(boundsDuration.inMicroseconds),
            if (boundsRange != null) boundsRangeField.name: boundsRange.json,
            if (boundsPeriod != null) boundsPeriodField.name: boundsPeriod.json,
            if (count != null) countField.name: JsonNumber(count),
            if (countMax != null) countMaxField.name: JsonNumber(countMax),
            if (duration != null) durationField.name: JsonNumber(duration),
            if (durationMax != null)
              durationMaxField.name: JsonNumber(durationMax),
            if (durationUnit != null)
              durationUnitField.name: JsonString(durationUnit),
            if (frequency != null) frequencyField.name: JsonNumber(frequency),
            if (frequencyMax != null)
              frequencyMaxField.name: JsonNumber(frequencyMax),
            if (period != null) periodField.name: JsonNumber(period),
            if (periodMax != null) periodMaxField.name: JsonNumber(periodMax),
            if (periodUnit != null)
              periodUnitField.name: JsonString(periodUnit),
            if (dayOfWeek != null)
              dayOfWeekField.name:
                  JsonArray.unmodifiable(dayOfWeek.map(JsonString.new)),
            if (timeOfDay != null)
              timeOfDayField.name: JsonArray.unmodifiable(
                timeOfDay.map((e) => JsonString(e.toString())),
              ),
            if (when != null)
              whenField.name: JsonArray.unmodifiable(when.map(JsonString.new)),
            if (offset != null) offsetField.name: JsonNumber(offset),
          }),
        );

  /// Creates a new [Repeat] instance from a [JsonObject].
  Repeat.fromJson(this._json);

  final JsonObject _json;

  /// Either a duration for the length of the timing schedule, a range of possible length, or outer bounds for start and/or end limits of the timing schedule.
  Duration? get boundsDuration => boundsDurationField.getValue(_json);

  /// Either a duration for the length of the timing schedule, a range of possible length, or outer bounds for start and/or end limits of the timing schedule.
  Range? get boundsRange => boundsRangeField.getValue(_json);

  /// Either a duration for the length of the timing schedule, a range of possible length, or outer bounds for start and/or end limits of the timing schedule.
  Period? get boundsPeriod => boundsPeriodField.getValue(_json);

  /// A total count of the desired number of repetitions across the duration of the entire timing specification.
  /// If countMax is present, this element indicates the lower bound of the allowed range of count values.
  int? get count => countField.getValue(_json);

  /// If present, indicates that the count is a range - so to perform the action between [count] and [countMax] times.
  int? get countMax => countMaxField.getValue(_json);

  /// How long this thing happens for when it happens.
  num? get duration => durationField.getValue(_json);

  /// If present, indicates that the duration is a range - so to perform the action between [duration] and [durationMax] time length.
  num? get durationMax => durationMaxField.getValue(_json);

  /// The units of time for the duration, in UCUM units.
  String? get durationUnit => durationUnitField.getValue(_json);

  /// The number of times to repeat the action within the specified period. If frequencyMax is present, this element indicates the lower bound of the allowed range of the frequency.
  int? get frequency => frequencyField.getValue(_json);

  /// If present, indicates that the frequency is a range - so to repeat between [frequency] and [frequencyMax] times within the period or period range.
  int? get frequencyMax => frequencyMaxField.getValue(_json);

  /// Indicates the duration of time over which repetitions are to occur; e.g. to express "3 times per day", 3 would be the frequency and "1 day" would be the period. If periodMax is present, this element indicates the lower bound of the allowed range of the period length.
  num? get period => periodField.getValue(_json);

  /// If present, indicates that the period is a range from [period] to [periodMax], allowing expressing concepts such as "do this once every 3-5 days.
  num? get periodMax => periodMaxField.getValue(_json);

  /// The units of time for the period in UCUM units.
  String? get periodUnit => periodUnitField.getValue(_json);

  /// If one or more days of week is provided, then the action happens only on the specified day(s).
  FixedList<String?>? get dayOfWeek => dayOfWeekField.getValue(_json);

  /// Specified time of day for action to take place.
  FixedList<Time>? get timeOfDay => timeOfDayField.getValue(_json);

  /// Real world events that the occurrence of the event should be tied to.
  FixedList<String?>? get when => whenField.getValue(_json);

  /// The number of minutes from the event. If the event code does not indicate whether the minutes is before or after the event, then the offset is assumed to be after the event.
  int? get offset => offsetField.getValue(_json);

  /// Field definition for [boundsDuration]
  static const boundsDurationField = FieldDefinition(
    name: 'boundsDuration',
    getValue: _getBoundsDuration,
  );

  /// Field definition for [boundsRange]
  static const boundsRangeField = FieldDefinition(
    name: 'boundsRange',
    getValue: _getBoundsRange,
  );

  /// Field definition for [boundsPeriod]
  static const boundsPeriodField = FieldDefinition(
    name: 'boundsPeriod',
    getValue: _getBoundsPeriod,
  );

  /// Field definition for [count]
  static const countField = FieldDefinition(
    name: 'count',
    getValue: _getCount,
  );

  /// Field definition for [countMax]
  static const countMaxField = FieldDefinition(
    name: 'countMax',
    getValue: _getCountMax,
  );

  /// Field definition for [duration]
  static const durationField = FieldDefinition(
    name: 'duration',
    getValue: _getDuration,
  );

  /// Field definition for [durationMax]
  static const durationMaxField = FieldDefinition(
    name: 'durationMax',
    getValue: _getDurationMax,
  );

  /// Field definition for [durationUnit]
  static const durationUnitField = FieldDefinition(
    name: 'durationUnit',
    getValue: _getDurationUnit,
  );

  /// Field definition for [frequency]
  static const frequencyField = FieldDefinition(
    name: 'frequency',
    getValue: _getFrequency,
  );

  /// Field definition for [frequencyMax]
  static const frequencyMaxField = FieldDefinition(
    name: 'frequencyMax',
    getValue: _getFrequencyMax,
  );

  /// Field definition for [period]
  static const periodField = FieldDefinition(
    name: 'period',
    getValue: _getPeriod,
  );

  /// Field definition for [periodMax]
  static const periodMaxField = FieldDefinition(
    name: 'periodMax',
    getValue: _getPeriodMax,
  );

  /// Field definition for [periodUnit]
  static const periodUnitField = FieldDefinition(
    name: 'periodUnit',
    getValue: _getPeriodUnit,
  );

  /// Field definition for [dayOfWeek]
  static const dayOfWeekField = FieldDefinition(
    name: 'dayOfWeek',
    getValue: _getDayOfWeek,
  );

  /// Field definition for [timeOfDay]
  static const timeOfDayField = FieldDefinition(
    name: 'timeOfDay',
    getValue: _getTimeOfDay,
  );

  /// Field definition for [when]
  static const whenField = FieldDefinition(
    name: 'when',
    getValue: _getWhen,
  );

  /// Field definition for [offset]
  static const offsetField = FieldDefinition(
    name: 'offset',
    getValue: _getOffset,
  );

  /// All field definitions for [Repeat]
  static const fieldDefinitions = [
    boundsDurationField,
    boundsRangeField,
    boundsPeriodField,
    countField,
    countMaxField,
    durationField,
    durationMaxField,
    durationUnitField,
    frequencyField,
    frequencyMaxField,
    periodField,
    periodMaxField,
    periodUnitField,
    dayOfWeekField,
    timeOfDayField,
    whenField,
    offsetField,
  ];

  static Duration? _getBoundsDuration(JsonObject jo) {
    final value = jo.getValue(boundsDurationField.name).numericValue;
    return value != null ? Duration(microseconds: value.toInt()) : null;
  }

  static Range? _getBoundsRange(JsonObject jo) => switch (jo['boundsRange']) {
        (final JsonObject jsonObject) => Range.fromJson(jsonObject),
        _ => null,
      };

  static Period? _getBoundsPeriod(JsonObject jo) =>
      switch (jo['boundsPeriod']) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  static int? _getCount(JsonObject jo) =>
      jo.getValue(countField.name).numericValue?.toInt();

  static int? _getCountMax(JsonObject jo) =>
      jo.getValue(countMaxField.name).numericValue?.toInt();

  static num? _getDuration(JsonObject jo) =>
      jo.getValue(durationField.name).numericValue;

  static num? _getDurationMax(JsonObject jo) =>
      jo.getValue(durationMaxField.name).numericValue;

  static String? _getDurationUnit(JsonObject jo) =>
      jo.getValue(durationUnitField.name).stringValue;

  static int? _getFrequency(JsonObject jo) =>
      jo.getValue(frequencyField.name).numericValue?.toInt();

  static int? _getFrequencyMax(JsonObject jo) =>
      jo.getValue(frequencyMaxField.name).numericValue?.toInt();

  static num? _getPeriod(JsonObject jo) =>
      jo.getValue(periodField.name).numericValue;

  static num? _getPeriodMax(JsonObject jo) =>
      jo.getValue(periodMaxField.name).numericValue;

  static String? _getPeriodUnit(JsonObject jo) =>
      jo.getValue(periodUnitField.name).stringValue;

  static FixedList<String?>? _getDayOfWeek(JsonObject jo) =>
      switch (jo['dayOfWeek']) {
        (final JsonArray jsonArray) =>
          FixedList(jsonArray.value.map((e) => (e as JsonString).value)),
        _ => null,
      };

  static FixedList<Time>? _getTimeOfDay(JsonObject jo) =>
      switch (jo['timeOfDay']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Time.tryParse((e as JsonString).value)!),
          ),
        _ => null,
      };

  static FixedList<String?>? _getWhen(JsonObject jo) => switch (jo['when']) {
        (final JsonArray jsonArray) =>
          FixedList(jsonArray.value.map((e) => (e as JsonString).value)),
        _ => null,
      };

  static int? _getOffset(JsonObject jo) =>
      jo.getValue(offsetField.name).numericValue?.toInt();

  /// Converts this [Repeat] instance to a JSON object.
  JsonObject get json => _json;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Repeat &&
          other.boundsDuration == boundsDuration &&
          other.boundsRange == boundsRange &&
          other.boundsPeriod == boundsPeriod &&
          other.count == count &&
          other.countMax == countMax &&
          other.duration == duration &&
          other.durationMax == durationMax &&
          other.durationUnit == durationUnit &&
          other.frequency == frequency &&
          other.frequencyMax == frequencyMax &&
          other.period == period &&
          other.periodMax == periodMax &&
          other.periodUnit == periodUnit &&
          other.dayOfWeek == dayOfWeek &&
          other.timeOfDay == timeOfDay &&
          other.when == when &&
          other.offset == offset);

  @override
  int get hashCode => Object.hash(
        boundsDuration,
        boundsRange,
        boundsPeriod,
        count,
        countMax,
        duration,
        durationMax,
        durationUnit,
        frequency,
        frequencyMax,
        period,
        periodMax,
        periodUnit,
        dayOfWeek,
        timeOfDay,
        when,
        offset,
      );
}

// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/fixed_list.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/range.dart';
import 'package:fhir_client/models/time.dart';

/// A set of rules that describe when the event should occur.
class Repeat {
  Repeat({
    this.boundsDuration,
    this.boundsRange,
    this.boundsPeriod,
    this.count,
    this.countMax,
    this.duration,
    this.durationMax,
    this.durationUnit,
    this.frequency,
    this.frequencyMax,
    this.period,
    this.periodMax,
    this.periodUnit,
    this.dayOfWeek,
    this.timeOfDay,
    this.when,
    this.offset,
  });

  factory Repeat.fromJson(Map<String, dynamic> json) => Repeat(
        boundsDuration: json['boundsDuration'] != null
            ? Duration(microseconds: json['boundsDuration'] as int)
            : null,
        boundsRange: json['boundsRange'] != null
            ? Range.fromJson(json['boundsRange'] as Map<String, dynamic>)
            : null,
        boundsPeriod: json['boundsPeriod'] != null
            ? Period.fromJson(json['boundsPeriod'] as Map<String, dynamic>)
            : null,
        count: json['count'] as int?,
        countMax: json['countMax'] as int?,
        duration: json['duration'] as num?,
        durationMax: json['durationMax'] as num?,
        durationUnit: json['durationUnit'] as String?,
        frequency: json['frequency'] as int?,
        frequencyMax: json['frequencyMax'] as int?,
        period: json['period'] as num?,
        periodMax: json['periodMax'] as num?,
        periodUnit: json['periodUnit'] as String?,
        dayOfWeek: (json['dayOfWeek'] as List<dynamic>?)
            ?.map((e) => e as String?)
            .toFixedList(),
        timeOfDay: (json['timeOfDay'] as List<dynamic>?)
            ?.map((e) => Time.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        when: (json['when'] as List<dynamic>?)
            ?.map((e) => e as String?)
            .toFixedList(),
        offset: json['offset'] as int?,
      );

  /// Either a duration for the length of the timing schedule, a range of possible length, or outer bounds for start and/or end limits of the timing schedule.
  final Duration? boundsDuration;

  /// Either a duration for the length of the timing schedule, a range of possible length, or outer bounds for start and/or end limits of the timing schedule.
  final Range? boundsRange;

  /// Either a duration for the length of the timing schedule, a range of possible length, or outer bounds for start and/or end limits of the timing schedule.
  final Period? boundsPeriod;

  /// A total count of the desired number of repetitions across the duration of the entire timing specification.
  /// If countMax is present, this element indicates the lower bound of the allowed range of count values.
  final int? count;

  /// If present, indicates that the count is a range - so to perform the action between [count] and [countMax] times.
  final int? countMax;

  /// How long this thing happens for when it happens.
  final num? duration;

  /// If present, indicates that the duration is a range - so to perform the action between [duration] and [durationMax] time length.
  final num? durationMax;

  /// The units of time for the duration, in UCUM units.
  final String? durationUnit;

  /// The number of times to repeat the action within the specified period. If frequencyMax is present, this element indicates the lower bound of the allowed range of the frequency.
  final int? frequency;

  /// If present, indicates that the frequency is a range - so to repeat between [frequency] and [frequencyMax] times within the period or period range.
  final int? frequencyMax;

  /// Indicates the duration of time over which repetitions are to occur; e.g. to express "3 times per day", 3 would be the frequency and "1 day" would be the period. If periodMax is present, this element indicates the lower bound of the allowed range of the period length.
  final num? period;

  /// If present, indicates that the period is a range from [period] to [periodMax], allowing expressing concepts such as "do this once every 3-5 days.
  final num? periodMax;

  /// The units of time for the period in UCUM units.
  final String? periodUnit;

  /// If one or more days of week is provided, then the action happens only on the specified day(s).
  final FixedList<String?>? dayOfWeek;

  /// Specified time of day for action to take place.
  final FixedList<Time>? timeOfDay;

  /// Real world events that the occurrence of the event should be tied to.
  final FixedList<String?>? when;

  /// The number of minutes from the event. If the event code does not indicate whether the minutes is before or after the event, then the offset is assumed to be after the event.
  final int? offset;

  Map<String, dynamic> toJson() => {
        'boundsDuration': boundsDuration?.inMicroseconds,
        'boundsRange': boundsRange?.toJson(),
        'boundsPeriod': boundsPeriod?.toJson(),
        'count': count,
        'countMax': countMax,
        'duration': duration,
        'durationMax': durationMax,
        'durationUnit': durationUnit,
        'frequency': frequency,
        'frequencyMax': frequencyMax,
        'period': period,
        'periodMax': periodMax,
        'periodUnit': periodUnit,
        'dayOfWeek': dayOfWeek,
        'timeOfDay': timeOfDay?.map((e) => e.toJson()).toFixedList(),
        'when': when,
        'offset': offset,
      };
}

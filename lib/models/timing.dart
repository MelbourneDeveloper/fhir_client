// ignore_for_file: lines_longer_than_80_chars

import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/repeat.dart';

/// Specifies an event that may occur multiple times.
/// Timing schedules are used to record when things are planned, expected or requested to occur.
/// The most common usage is in dosage instructions for medications.
/// They are also used when planning care of various kinds, and may be used for reporting the schedule to which past regular activities were carried out.
class Timing {
  Timing({this.event, this.repeat, this.code});

  factory Timing.fromJson(Map<String, dynamic> json) => Timing(
        event: (json['event'] as List<dynamic>?)
            ?.map((e) => DateTime.parse(e as String))
            .toFixedList(),
        repeat: json['repeat'] != null
            ? Repeat.fromJson(json['repeat'] as Map<String, dynamic>)
            : null,
        code: json['code'] != null
            ? CodeableConcept.fromJson(json['code'] as Map<String, dynamic>)
            : null,
      );

  /// Identifies specific times when the event occurs.
  final FixedList<DateTime>? event;

  /// A set of rules that describe when the event is scheduled.
  final Repeat? repeat;

  /// A code for the timing schedule (or just text in code.text).
  /// The code is interpreted in the context of the ValueSet specified in the containing resource,
  /// and may be a specific code, or a more general category, such as "BID" (twice a day) or "Q4H" (every 4 hours).
  final CodeableConcept? code;

  Map<String, dynamic> toJson() => {
        'event': event?.map((e) => e.toIso8601String()).toFixedList(),
        'repeat': repeat?.toJson(),
        'code': code?.toJson(),
      };
}

// ignore_for_file: lines_longer_than_80_chars, comment_references

import 'package:fhir_client/models/actor.dart';
import 'package:fhir_client/models/address.dart';
import 'package:fhir_client/models/admit_source.dart';
import 'package:fhir_client/models/annotation.dart';
import 'package:fhir_client/models/available_time.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/json_object.dart';
import 'package:fhir_client/models/basic_types/time.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/codeable_reference.dart';
import 'package:fhir_client/models/entry.dart';
import 'package:fhir_client/models/extension.dart';
import 'package:fhir_client/models/identifier.dart';
import 'package:fhir_client/models/issue.dart';
import 'package:fhir_client/models/link.dart';
import 'package:fhir_client/models/location.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/name.dart';
import 'package:fhir_client/models/observation_component.dart';
import 'package:fhir_client/models/observation_reference_range.dart';
import 'package:fhir_client/models/participant.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/planning_horizon.dart';
import 'package:fhir_client/models/quantity.dart';
import 'package:fhir_client/models/range.dart';
import 'package:fhir_client/models/ratio.dart';
import 'package:fhir_client/models/reference.dart';
import 'package:fhir_client/models/sampled_data.dart';
import 'package:fhir_client/models/telecom.dart';
import 'package:fhir_client/models/text.dart';
import 'package:fhir_client/models/timing.dart';
import 'package:fhir_client/models/type.dart' as t;
import 'package:fhir_client/models/value_sets/administrative_gender.dart';
import 'package:fhir_client/models/value_sets/resource_type.dart';

/// Either a successful [Resource] result or an [OperationOutcome] (error)
sealed class Result<T> {}

/// A [Bundle] of [Resource]s with a strong type
final class BundleEntries<T> implements Result<T> {
  BundleEntries(this.entries, this.bundle);

  /// The entries in the bundle
  final FixedList<T> entries;

  /// The bundle itself
  final Bundle bundle;

  int get length => entries.length;
}

/// Any of the FHIR resources
sealed class Resource extends JsonObject {
  Resource._internal(
    super.json,
  );

  factory Resource.fromJson(
    Map<String, dynamic> map,
  ) =>
      switch (ResourceType.fromCode(map['resourceType'] as String? ?? '')) {
        (ResourceType.appointment) => Appointment.fromJson(map),
        (ResourceType.bundle) => Bundle.fromJson(map),
        (ResourceType.encounter) => Encounter.fromJson(map),
        (ResourceType.observation) => Observation.fromJson(map),
        (ResourceType.organization) => Organization.fromJson(map),
        (ResourceType.operationOutcome) =>
          OperationOutcome<String>.fromJson(map),
        (ResourceType.patient) => Patient.fromJson(map),
        (ResourceType.practitioner) => Practitioner.fromJson(map),
        (ResourceType.practitionerRole) => PractitionerRole.fromJson(map),
        (ResourceType.schedule) => Schedule.fromJson(map),
        (ResourceType.slot) => Slot.fromJson(map),
      };

  Definable<String> get id => getValue('id');
  Definable<Meta> get meta => getValue('meta');
}

class Appointment extends Resource {
  Appointment({
    String? id,
    Meta? meta,
    this.status,
    this.serviceCategory,
    this.participant,
  }) : super._internal(
          id,
          meta,
        );

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json['id'] != null ? json['id'] as String? : null,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        status: json['status'] != null ? json['status'] as String? : null,
        serviceCategory: (json['serviceCategory'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        participant: (json['participant'] as List<dynamic>?)
            ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
      );

  final String? status;
  final FixedList<CodeableConcept>? serviceCategory;
  final FixedList<Participant>? participant;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.appointment.code,
        'id': id,
        'meta': meta?.toJson(),
        'status': status,
        'serviceCategory':
            serviceCategory?.map((e) => e.toJson()).toFixedList(),
        'participant': participant?.map((e) => e.toJson()).toFixedList(),
      };
}

class Bundle extends Resource {
  Bundle({
    required String? id,
    required Meta? meta,
    this.extension,
    this.identifier,
    this.active,
    this.type,
    this.name,
    this.code,
    this.location,
    this.link,
    this.entry,
  }) : super._internal(
          id,
          meta,
        );

  factory Bundle.fromJson(Map<String, dynamic> json) => Bundle(
        id: json['id'] as String,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        extension: (json['extension'] as List<dynamic>?)
            ?.map((e) => Extension.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        active: json['active'] != null ? json['active'] as bool? : null,
        type: json['type'] as String?,
        name: json['name'] != null ? json['name'] as String? : null,
        code: (json['code'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        location: (json['location'] as List<dynamic>?)
            ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        link: (json['link'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        entry: (json['entry'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
      );

  final FixedList<Extension>? extension;
  final FixedList<Identifier>? identifier;
  final bool? active;
  final String? type;
  final String? name;
  final FixedList<CodeableConcept>? code;
  final FixedList<Location>? location;
  final FixedList<Link>? link;
  final FixedList<Entry>? entry;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.bundle.code,
        'id': id,
        'meta': meta?.toJson(),
        'extension': extension?.map((e) => e.toJson()).toFixedList(),
        'identifier': identifier?.map((e) => e.toJson()).toFixedList(),
        'active': active,
        'type': type,
        'name': name,
        'code': code?.map((e) => e.toJson()).toFixedList(),
        'location': location?.map((e) => e.toJson()).toFixedList(),
        'link': link?.map((e) => e.toJson()).toFixedList(),
        'entry': entry?.map((e) => e.toJson()).toFixedList(),
      };
}

class Encounter extends Resource {
  Encounter({
    String? id,
    Meta? meta,
    this.identifier,
    this.status,
    this.classCode,
    this.type,
    this.serviceType,
    this.priority,
    this.subject,
    this.participant,
    this.period,
    this.length,
    this.reasonCode,
    this.hospitalization,
    this.location,
  }) : super._internal(id, meta);

  factory Encounter.fromJson(Map<String, dynamic> json) => Encounter(
        id: json['id'] as String?,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        status: json['status'] as String?,
        classCode: json['class'] != null
            ? CodeableConcept.fromJson(json['class'] as Map<String, dynamic>)
            : null,
        type: (json['type'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        serviceType: json['serviceType'] != null
            ? CodeableConcept.fromJson(
                json['serviceType'] as Map<String, dynamic>,
              )
            : null,
        priority: json['priority'] != null
            ? CodeableConcept.fromJson(json['priority'] as Map<String, dynamic>)
            : null,
        subject: json['subject'] != null
            ? Reference.fromJson(json['subject'] as Map<String, dynamic>)
            : null,
        participant: (json['participant'] as List<dynamic>?)
            ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        period: json['period'] != null
            ? Period.fromJson(json['period'] as Map<String, dynamic>)
            : null,
        length: json['length'] != null
            ? Duration(
                milliseconds: (json['length'] as int) * 1000,
              )
            : null,
        reasonCode: (json['reasonCode'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        hospitalization: json['hospitalization'] != null
            ? Hospitalization.fromJson(
                json['hospitalization'] as Map<String, dynamic>,
              )
            : null,
        location: (json['location'] as List<dynamic>?)
            ?.map((e) => Reference.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
      );

  final FixedList<Identifier>? identifier;
  final String? status;

  /// Classification of patient encounter context - e.g. Inpatient, outpatient.
  /// Note: actual FHIR field is Class
  final CodeableConcept? classCode;

  final FixedList<CodeableConcept>? type;
  final CodeableConcept? serviceType;
  final CodeableConcept? priority;
  final Reference? subject;
  final FixedList<Participant>? participant;
  final Period? period;
  final Duration? length;
  final FixedList<CodeableConcept>? reasonCode;
  final Hospitalization? hospitalization;
  final FixedList<Reference>? location;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.encounter.code,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toFixedList(),
        'status': status,
        'class': classCode?.toJson(),
        'type': type?.map((e) => e.toJson()).toFixedList(),
        'serviceType': serviceType?.toJson(),
        'priority': priority?.toJson(),
        'subject': subject?.toJson(),
        'participant': participant?.map((e) => e.toJson()).toFixedList(),
        'period': period?.toJson(),
        'length': length?.inMilliseconds != null
            ? length!.inMilliseconds ~/ 1000
            : null,
        'reasonCode': reasonCode?.map((e) => e.toJson()).toFixedList(),
        'hospitalization': hospitalization?.toJson(),
        'location': location?.map((e) => e.toJson()).toFixedList(),
      };
}

class Hospitalization {
  Hospitalization({
    this.admitSource,
    this.period,
    this.specialCourtesy,
    this.destination,
    this.preAdmissionIdentifier,
  });
  factory Hospitalization.fromJson(Map<String, dynamic> json) =>
      Hospitalization(
        admitSource: json['admitSource'] != null
            ? AdmitSource.fromJson(json['admitSource'] as Map<String, dynamic>)
            : null,
        period: json['period'] != null
            ? Period.fromJson(json['period'] as Map<String, dynamic>)
            : null,
        specialCourtesy: (json['specialCourtesy'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        destination: (json['destination'] as List<dynamic>?)
            ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        preAdmissionIdentifier:
            (json['preAdmissionIdentifier'] as List<dynamic>?)
                ?.map((e) => Reference.fromJson(e as Map<String, dynamic>))
                .toFixedList(),
      );

  final AdmitSource? admitSource;
  final Period? period;
  final FixedList<CodeableConcept>? specialCourtesy;
  final FixedList<Location>? destination;
  final FixedList<Reference>? preAdmissionIdentifier;

  Map<String, dynamic> toJson() => {
        'admitSource': admitSource?.toJson(),
        'period': period?.toJson(),
        'specialCourtesy':
            specialCourtesy?.map((e) => e.toJson()).toFixedList(),
        'destination': destination?.map((e) => e.toJson()).toFixedList(),
        'preAdmissionIdentifier':
            preAdmissionIdentifier?.map((e) => e.toJson()).toFixedList(),
      };
}

// Observation fields
const _identifierField = 'identifier';
const _basedOnField = 'basedOn';
const _partOfField = 'partOf';
const _statusField = 'status';
const _categoryField = 'category';
const _codeField = 'code';
const _subjectField = 'subject';
const _encounterField = 'encounter';
const _effectiveDateTimeField = 'effectiveDateTime';
const _effectivePeriodField = 'effectivePeriod';
const _effectiveTimingField = 'effectiveTiming';
const _effectiveInstantField = 'effectiveInstant';
const _issuedField = 'issued';
const _valueQuantityField = 'valueQuantity';
const _valueCodeableConceptField = 'valueCodeableConcept';
const _valueStringField = 'valueString';
const _valueBooleanField = 'valueBoolean';
const _valueIntegerField = 'valueInteger';
const _valueRangeField = 'valueRange';
const _valueRatioField = 'valueRatio';
const _valueSampledDataField = 'valueSampledData';
const _valueTimeField = 'valueTime';
const _valueDateTimeField = 'valueDateTime';
const _valuePeriodField = 'valuePeriod';
const _dataAbsentReasonField = 'dataAbsentReason';
const _interpretationField = 'interpretation';
const _noteField = 'note';
const _bodySiteField = 'bodySite';
const _methodField = 'method';
const _specimenField = 'specimen';
const _deviceField = 'device';
const _referenceRangeField = 'referenceRange';
const _hasMemberField = 'hasMember';
const _derivedFromField = 'derivedFrom';
const _componentField = 'component';
const _complicatedByField = 'complicatedBy';
const _contextOfUseField = 'contextOfUse';
//-----------------------

/// Measurements and simple assertions made about a patient, device or other subject.
class Observation extends Resource {
  /// Constructs a new [Observation].
  Observation({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<FixedList<Identifier>> identifier = const Undefined(),
    Definable<FixedList<Reference>> basedOn = const Undefined(),
    Definable<FixedList<Reference>> partOf = const Undefined(),
    Definable<String> status = const Undefined(),
    Definable<FixedList<CodeableConcept>> category = const Undefined(),
    Definable<CodeableConcept> code = const Undefined(),
    Definable<Reference> subject = const Undefined(),
    Definable<Reference> encounter = const Undefined(),
    Definable<DateTime> effectiveDateTime = const Undefined(),
    Definable<Period> effectivePeriod = const Undefined(),
    Definable<Timing> effectiveTiming = const Undefined(),
    Definable<DateTime> effectiveInstant = const Undefined(),
    Definable<DateTime> issued = const Undefined(),
    Definable<Quantity> valueQuantity = const Undefined(),
    Definable<CodeableConcept> valueCodeableConcept = const Undefined(),
    Definable<String> valueString = const Undefined(),
    Definable<bool> valueBoolean = const Undefined(),
    Definable<int> valueInteger = const Undefined(),
    Definable<Range> valueRange = const Undefined(),
    Definable<Ratio> valueRatio = const Undefined(),
    Definable<SampledData> valueSampledData = const Undefined(),
    Definable<Time> valueTime = const Undefined(),
    Definable<DateTime> valueDateTime = const Undefined(),
    Definable<Period> valuePeriod = const Undefined(),
    Definable<CodeableConcept> dataAbsentReason = const Undefined(),
    Definable<FixedList<CodeableConcept>> interpretation = const Undefined(),
    Definable<FixedList<Annotation>> note = const Undefined(),
    Definable<CodeableConcept> bodySite = const Undefined(),
    Definable<CodeableConcept> method = const Undefined(),
    Definable<Reference> specimen = const Undefined(),
    Definable<Reference> device = const Undefined(),
    Definable<FixedList<ObservationReferenceRange>> referenceRange =
        const Undefined(),
    Definable<FixedList<Reference>> hasMember = const Undefined(),
    Definable<FixedList<Reference>> derivedFrom = const Undefined(),
    Definable<FixedList<ObservationComponent>> component = const Undefined(),
    Definable<FixedList<CodeableReference>> complicatedBy = const Undefined(),
    Definable<FixedList<CodeableReference>> contextOfUse = const Undefined(),
  }) : super._internal(
          {
            if (id is Defined<String>) 'id': id.value,
            if (meta is Defined<Meta>) 'meta': meta.value,
            if (identifier is Defined<FixedList<Identifier>>)
              _identifierField: identifier.value,
            if (basedOn is Defined<FixedList<Reference>>)
              _basedOnField: basedOn.value,
            if (partOf is Defined<FixedList<Reference>>)
              _partOfField: partOf.value,
            if (status is Defined<String>) _statusField: status.value,
            if (category is Defined<FixedList<CodeableConcept>>)
              _categoryField: category.value,
            if (code is Defined<CodeableConcept>) _codeField: code.value,
            if (subject is Defined<Reference>) _subjectField: subject.value,
            if (encounter is Defined<Reference>)
              _encounterField: encounter.value,
            if (effectiveDateTime is Defined<DateTime>)
              _effectiveDateTimeField:
                  effectiveDateTime.value?.toIso8601String(),
            if (effectivePeriod is Defined<Period>)
              _effectivePeriodField: effectivePeriod.value,
            if (effectiveTiming is Defined<Timing>)
              _effectiveTimingField: effectiveTiming.value,
            if (effectiveInstant is Defined<DateTime>)
              _effectiveInstantField: effectiveInstant.value?.toIso8601String(),
            if (issued is Defined<DateTime>)
              _issuedField: issued.value?.toIso8601String(),
            if (valueQuantity is Defined<Quantity>)
              _valueQuantityField: valueQuantity.value,
            if (valueCodeableConcept is Defined<CodeableConcept>)
              _valueCodeableConceptField: valueCodeableConcept.value,
            if (valueString is Defined<String>)
              _valueStringField: valueString.value,
            if (valueBoolean is Defined<bool>)
              _valueBooleanField: valueBoolean.value,
            if (valueInteger is Defined<int>)
              _valueIntegerField: valueInteger.value,
            if (valueRange is Defined<Range>)
              _valueRangeField: valueRange.value,
            if (valueRatio is Defined<Ratio>)
              _valueRatioField: valueRatio.value,
            if (valueSampledData is Defined<SampledData>)
              _valueSampledDataField: valueSampledData.value,
            if (valueTime is Defined<Time>)
              _valueTimeField: valueTime.value.toString(),
            if (valueDateTime is Defined<DateTime>)
              _valueDateTimeField: valueDateTime.value?.toIso8601String(),
            if (valuePeriod is Defined<Period>)
              _valuePeriodField: valuePeriod.value,
            if (dataAbsentReason is Defined<CodeableConcept>)
              _dataAbsentReasonField: dataAbsentReason.value,
            if (interpretation is Defined<FixedList<CodeableConcept>>)
              _interpretationField: interpretation.value,
            if (note is Defined<FixedList<Annotation>>) _noteField: note.value,
            if (bodySite is Defined<CodeableConcept>)
              _bodySiteField: bodySite.value,
            if (method is Defined<CodeableConcept>) _methodField: method.value,
            if (specimen is Defined<Reference>) _specimenField: specimen.value,
            if (device is Defined<Reference>) _deviceField: device.value,
            if (referenceRange is Defined<FixedList<ObservationReferenceRange>>)
              _referenceRangeField: referenceRange.value,
            if (hasMember is Defined<FixedList<Reference>>)
              _hasMemberField: hasMember.value,
            if (derivedFrom is Defined<FixedList<Reference>>)
              _derivedFromField: derivedFrom.value,
            if (component is Defined<FixedList<ObservationComponent>>)
              _componentField: component.value,
            if (complicatedBy is Defined<FixedList<CodeableReference>>)
              _complicatedByField: complicatedBy.value,
            if (contextOfUse is Defined<FixedList<CodeableReference>>)
              _contextOfUseField: contextOfUse.value,
          },
        );

  /// Constructs a new [Observation]. This constructor treats nulls as undefined.
  Observation.primitives({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    FixedList<Reference>? basedOn,
    FixedList<Reference>? partOf,
    String? status,
    FixedList<CodeableConcept>? category,
    CodeableConcept? code,
    Reference? subject,
    Reference? encounter,
    DateTime? effectiveDateTime,
    Period? effectivePeriod,
    Timing? effectiveTiming,
    DateTime? effectiveInstant,
    DateTime? issued,
    Quantity? valueQuantity,
    CodeableConcept? valueCodeableConcept,
    String? valueString,
    bool? valueBoolean,
    int? valueInteger,
    Range? valueRange,
    Ratio? valueRatio,
    SampledData? valueSampledData,
    Time? valueTime,
    DateTime? valueDateTime,
    Period? valuePeriod,
    CodeableConcept? dataAbsentReason,
    FixedList<CodeableConcept>? interpretation,
    FixedList<Annotation>? note,
    CodeableConcept? bodySite,
    CodeableConcept? method,
    Reference? specimen,
    Reference? device,
    FixedList<ObservationReferenceRange>? referenceRange,
    FixedList<Reference>? hasMember,
    FixedList<Reference>? derivedFrom,
    FixedList<ObservationComponent>? component,
    FixedList<CodeableReference>? complicatedBy,
    FixedList<CodeableReference>? contextOfUse,
  }) : super._internal(
          {
            if (id != null) 'id': id,
            if (meta != null) 'meta': meta,
            if (identifier != null) _identifierField: identifier,
            if (basedOn != null) _basedOnField: basedOn,
            if (partOf != null) _partOfField: partOf,
            if (status != null) _statusField: status,
            if (category != null) _categoryField: category,
            if (code != null) _codeField: code,
            if (subject != null) _subjectField: subject,
            if (encounter != null) _encounterField: encounter,
            if (effectiveDateTime != null)
              _effectiveDateTimeField: effectiveDateTime.toIso8601String(),
            if (effectivePeriod != null) _effectivePeriodField: effectivePeriod,
            if (effectiveTiming != null) _effectiveTimingField: effectiveTiming,
            if (effectiveInstant != null)
              _effectiveInstantField: effectiveInstant.toIso8601String(),
            if (issued != null) _issuedField: issued.toIso8601String(),
            if (valueQuantity != null) _valueQuantityField: valueQuantity,
            if (valueCodeableConcept != null)
              _valueCodeableConceptField: valueCodeableConcept,
            if (valueString != null) _valueStringField: valueString,
            if (valueBoolean != null) _valueBooleanField: valueBoolean,
            if (valueInteger != null) _valueIntegerField: valueInteger,
            if (valueRange != null) _valueRangeField: valueRange,
            if (valueRatio != null) _valueRatioField: valueRatio,
            if (valueSampledData != null)
              _valueSampledDataField: valueSampledData,
            if (valueTime != null) _valueTimeField: valueTime.toString(),
            if (valueDateTime != null)
              _valueDateTimeField: valueDateTime.toIso8601String(),
            if (valuePeriod != null) _valuePeriodField: valuePeriod,
            if (dataAbsentReason != null)
              _dataAbsentReasonField: dataAbsentReason,
            if (interpretation != null) _interpretationField: interpretation,
            if (note != null) _noteField: note,
            if (bodySite != null) _bodySiteField: bodySite,
            if (method != null) _methodField: method,
            if (specimen != null) _specimenField: specimen,
            if (device != null) _deviceField: device,
            if (referenceRange != null) _referenceRangeField: referenceRange,
            if (hasMember != null) _hasMemberField: hasMember,
            if (derivedFrom != null) _derivedFromField: derivedFrom,
            if (component != null) _componentField: component,
            if (complicatedBy != null) _complicatedByField: complicatedBy,
            if (contextOfUse != null) _contextOfUseField: contextOfUse,
          },
        );

  /// Creates an [Observation] instance from the provided JSON object.
  Observation.fromJson(super.json) : super._internal();

  /// Business identifier for this observation.
  ///
  /// Type: List<Identifier>
  /// Path: Observation.identifier
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Identifier>> get identifier => getValueFromObjectArray(
        _identifierField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// A plan, proposal or order that is fulfilled in whole or in part by this event.
  ///
  /// Type: List<Reference>
  /// Path: Observation.basedOn
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Reference>> get basedOn => getValueFromObjectArray(
        _basedOnField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// A larger event of which this particular observation is a component or
  /// step.
  ///
  /// Type: List<Reference>
  /// Path: Observation.partOf
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Reference>> get partOf => getValueFromObjectArray(
        _partOfField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// The status of the result value.
  ///
  /// Type: CodeType
  /// Path: Observation.status
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  Definable<String> get status => getValue(_statusField);

  /// A code that classifies the general type of observation being made.
  ///
  /// Type: List<CodeableConcept>
  /// Path: Observation.category
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<CodeableConcept>> get category => getValueFromObjectArray(
        _categoryField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// Type of observation (code / type).
  ///
  /// Type: CodeableConcept
  /// Path: Observation.code
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get code => getValueFromObjectArray(
        _codeField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The patient, or group of patients, location, or device this observation
  /// is about and into whose record the observation is placed. If the actual
  /// focus of the observation is different from the subject (or a sample of,
  /// part, or region of the subject), the `focus` element or the
  /// `code` itself specifies the actual focus of the observation.
  ///
  /// Type: Reference
  /// Path: Observation.subject
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Reference> get subject => getValueFromObjectArray(
        _subjectField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The healthcare event (e.g. a patient and healthcare provider interaction)
  /// during which this observation is made.
  ///
  /// Type: Reference
  /// Path: Observation.encounter
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Reference> get encounter => getValueFromObjectArray(
        _encounterField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The time or time-period the observed value is asserted as being true.
  /// For biological subjects - e.g. human patients - this is usually called
  /// the "physiologically relevant time". This is usually either the time of
  /// the procedure or of specimen collection, but very often the source of
  /// the date/time is not known, only the date/time itself.
  ///
  /// Type: DateTimeType
  /// Path: Observation.effective[]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get effectiveDateTime => getValueFromString(
        _effectiveDateTimeField,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  /// The time or time-period the observed value is asserted as being true.
  /// For biological subjects - e.g. human patients - this is usually called
  /// the "physiologically relevant time". This is usually either the time of
  /// the procedure or of specimen collection, but very often the source of
  /// the date/time is not known, only the date/time itself.
  ///
  /// Type: Period
  /// Path: Observation.effective[]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Period> get effectivePeriod => getValueFromObjectArray(
        _effectivePeriodField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Period.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The time or time-period the observed value is asserted as being true.
  /// For biological subjects - e.g. human patients - this is usually called
  /// the "physiologically relevant time". This is usually either the time of
  /// the procedure or of specimen collection, but very often the source of
  /// the date/time is not known, only the date/time itself.
  ///
  /// Type: Timing
  /// Path: Observation.effective[]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Timing> get effectiveTiming => getValueFromObjectArray(
        _effectiveTimingField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Timing.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The time or time-period the observed value is asserted as being true.
  /// For biological subjects - e.g. human patients - this is usually called
  /// the "physiologically relevant time". This is usually either the time of
  /// the procedure or of specimen collection, but very often the source of
  /// the date/time is not known, only the date/time itself.
  ///
  /// Type: InstantType
  /// Path: Observation.effective[]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get effectiveInstant => getValueFromString(
        _effectiveInstantField,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  /// The date and time this version of the observation was made available to
  /// providers, typically after the results have been reviewed and verified.
  ///
  /// Type: InstantType
  /// Path: Observation.issued
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get issued => getValueFromString(
        _issuedField,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: Quantity
  /// Path: Observation.value[]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Quantity> get valueQuantity => getValueFromObjectArray(
        _valueQuantityField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Quantity.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: CodeableConcept
  /// Path: Observation.value[]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get valueCodeableConcept =>
      getValueFromObjectArray(
        _valueCodeableConceptField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: StringType
  /// Path: Observation.value[]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<String> get valueString => getValue(_valueStringField);

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: BooleanType
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<bool> get valueBoolean => getValue(_valueBooleanField);

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: IntegerType
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<int> get valueInteger => getValue(_valueIntegerField);

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: Range
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Range> get valueRange => getValueFromObjectArray(
        _valueRangeField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Range.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: Ratio
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Ratio> get valueRatio => getValueFromObjectArray(
        _valueRatioField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Ratio.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: SampledData
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<SampledData> get valueSampledData => getValueFromObjectArray(
        _valueSampledDataField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => SampledData.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: TimeType
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Time> get valueTime => getValueFromString(
        _valueTimeField,
        tryParse: (t) => Time.tryParse(t ?? ''),
      );

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: DateTimeType
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get valueDateTime => getValueFromString(
        _valueDateTimeField,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  /// The information determined as a result of making the observation, if the
  /// information has a simple value.
  ///
  /// Type: Period
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Period> get valuePeriod => getValueFromObjectArray(
        _valuePeriodField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Period.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// Provides a reason why the expected value in the element
  /// Observation.value[x] is missing.
  ///
  /// Type: CodeableConcept
  /// Path: Observation.dataAbsentReason
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get dataAbsentReason => getValueFromObjectArray(
        _dataAbsentReasonField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// A categorical assessment of an observation value. This is often used to
  /// supply a "normal" range categorization for numeric values.
  ///
  /// Type: List<CodeableConcept>
  /// Path: Observation.interpretation
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<CodeableConcept>> get interpretation =>
      getValueFromObjectArray(
        _interpretationField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// Comments about the observation or the results.
  ///
  /// Type: List<Annotation>
  /// Path: Observation.note
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Annotation>> get note => getValueFromObjectArray(
        _noteField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Annotation.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// Indicates the site on the subject's body where the observation was made
  /// (i.e. the target site).
  ///
  /// Type: CodeableConcept
  /// Path: Observation.bodySite
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get bodySite => getValueFromObjectArray(
        _bodySiteField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// Indicates the mechanism used to perform the observation.
  ///
  /// Type: CodeableConcept
  /// Path: Observation.method
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get method => getValueFromObjectArray(
        _methodField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// The specimen that was used when this observation was made.
  ///
  /// Type: Reference
  /// Path: Observation.specimen
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Reference> get specimen => getValueFromObjectArray(
        _specimenField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Reference> get device => getValueFromObjectArray(
        _deviceField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  /// Guidance on how to interpret the value by comparison to a normal or
  /// recommended range.
  ///
  /// Type: List<ObservationReferenceRange>
  /// Path: Observation.referenceRange
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<ObservationReferenceRange>> get referenceRange =>
      getValueFromObjectArray(
        _referenceRangeField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) =>
                ObservationReferenceRange.fromJson(dm as Map<String, dynamic>),)
            .toFixedList(),
      );

  /// This observation is a group observation (e.g. a battery, a panel of
  /// tests, a set of vital sign measurements) that includes the target as a
  /// member of the group.
  ///
  /// Type: List<Reference>
  /// Path: Observation.hasMember
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Reference>> get hasMember => getValueFromObjectArray(
        _hasMemberField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// The target resource that represents a measurement from which this
  /// observation value is derived. For example, a calculated anion gap or a
  /// fetal measurement based on an ultrasound image.
  ///
  /// Type: List<Reference>
  /// Path: Observation.derivedFrom
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Reference>> get derivedFrom => getValueFromObjectArray(
        _derivedFromField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// Some observations have multiple component observations. These component
  /// observations are expressed as separate code value pairs that share the
  /// same attributes. Examples include systolic and diastolic component
  /// observations for blood pressure measurement and multiple component
  /// observations for genetics observations.
  ///
  /// Type: List<ObservationComponent>
  /// Path: Observation.component
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<ObservationComponent>> get component =>
      getValueFromObjectArray(
        _componentField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) =>
                ObservationComponent.fromJson(dm as Map<String, dynamic>),)
            .toFixedList(),
      );

  /// The complications or conditions that interfere with the interpretation of
  /// the observation.
  ///
  /// Type: List<CodeableReference>
  /// Path: Observation.complicatedBy
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<CodeableReference>> get complicatedBy =>
      getValueFromObjectArray(
        _complicatedByField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map(
                (dm) => CodeableReference.fromJson(dm as Map<String, dynamic>),)
            .toFixedList(),
      );

  /// Details the use context for the Observation, if appropriate.
  ///
  /// Type: List<CodeableReference>
  /// Path: Observation.contextOfUse
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<CodeableReference>> get contextOfUse =>
      getValueFromObjectArray(
        _contextOfUseField,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map(
                (dm) => CodeableReference.fromJson(dm as Map<String, dynamic>),)
            .toFixedList(),
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Observation &&
          other.identifier == identifier &&
          other.basedOn == basedOn &&
          other.partOf == partOf &&
          other.status == status &&
          other.category == category &&
          other.code == code &&
          other.subject == subject &&
          other.encounter == encounter &&
          other.effectiveDateTime == effectiveDateTime &&
          other.effectivePeriod == effectivePeriod &&
          other.effectiveTiming == effectiveTiming &&
          other.effectiveInstant == effectiveInstant &&
          other.issued == issued &&
          other.valueQuantity == valueQuantity &&
          other.valueCodeableConcept == valueCodeableConcept &&
          other.valueString == valueString &&
          other.valueBoolean == valueBoolean &&
          other.valueInteger == valueInteger &&
          other.valueRange == valueRange &&
          other.valueRatio == valueRatio &&
          other.valueSampledData == valueSampledData &&
          other.valueTime == valueTime &&
          other.valueDateTime == valueDateTime &&
          other.valuePeriod == valuePeriod &&
          other.dataAbsentReason == dataAbsentReason &&
          other.interpretation == interpretation &&
          other.note == note &&
          other.bodySite == bodySite &&
          other.method == method &&
          other.specimen == specimen &&
          other.device == device &&
          other.referenceRange == referenceRange &&
          other.hasMember == hasMember &&
          other.derivedFrom == derivedFrom &&
          other.component == component &&
          other.complicatedBy == complicatedBy &&
          other.contextOfUse == contextOfUse);

  @override
  int get hashCode =>
      identifier.hashCode ^
      basedOn.hashCode ^
      partOf.hashCode ^
      status.hashCode ^
      category.hashCode ^
      code.hashCode ^
      subject.hashCode ^
      encounter.hashCode ^
      effectiveDateTime.hashCode ^
      effectivePeriod.hashCode ^
      effectiveTiming.hashCode ^
      effectiveInstant.hashCode ^
      issued.hashCode ^
      valueQuantity.hashCode ^
      valueCodeableConcept.hashCode ^
      valueString.hashCode ^
      valueBoolean.hashCode ^
      valueInteger.hashCode ^
      valueRange.hashCode ^
      valueRatio.hashCode ^
      valueSampledData.hashCode ^
      valueTime.hashCode ^
      valueDateTime.hashCode ^
      valuePeriod.hashCode ^
      dataAbsentReason.hashCode ^
      interpretation.hashCode ^
      note.hashCode ^
      bodySite.hashCode ^
      method.hashCode ^
      specimen.hashCode ^
      device.hashCode ^
      referenceRange.hashCode ^
      hasMember.hashCode ^
      derivedFrom.hashCode ^
      component.hashCode ^
      complicatedBy.hashCode ^
      contextOfUse.hashCode;

  /// Creates a copy of the [Observation] instance and allows
  /// for non-destructive mutation.
  Observation copyWith({
    Definable<FixedList<Identifier>>? identifier,
    Definable<FixedList<Reference>>? basedOn,
    Definable<FixedList<Reference>>? partOf,
    Definable<String>? status,
    Definable<FixedList<CodeableConcept>>? category,
    Definable<CodeableConcept>? code,
    Definable<Reference>? subject,
    Definable<Reference>? encounter,
    Definable<DateTime>? effectiveDateTime,
    Definable<Period>? effectivePeriod,
    Definable<Timing>? effectiveTiming,
    Definable<DateTime>? effectiveInstant,
    Definable<DateTime>? issued,
    Definable<Quantity>? valueQuantity,
    Definable<CodeableConcept>? valueCodeableConcept,
    Definable<String>? valueString,
    Definable<bool>? valueBoolean,
    Definable<int>? valueInteger,
    Definable<Range>? valueRange,
    Definable<Ratio>? valueRatio,
    Definable<SampledData>? valueSampledData,
    Definable<Time>? valueTime,
    Definable<DateTime>? valueDateTime,
    Definable<Period>? valuePeriod,
    Definable<CodeableConcept>? dataAbsentReason,
    Definable<FixedList<CodeableConcept>>? interpretation,
    Definable<FixedList<Annotation>>? note,
    Definable<CodeableConcept>? bodySite,
    Definable<CodeableConcept>? method,
    Definable<Reference>? specimen,
    Definable<Reference>? device,
    Definable<FixedList<ObservationReferenceRange>>? referenceRange,
    Definable<FixedList<Reference>>? hasMember,
    Definable<FixedList<Reference>>? derivedFrom,
    Definable<FixedList<ObservationComponent>>? component,
    Definable<FixedList<CodeableReference>>? complicatedBy,
    Definable<FixedList<CodeableReference>>? contextOfUse,
  }) =>
      Observation(
        id: id,
        meta: meta,
        identifier: identifier ?? this.identifier,
        basedOn: basedOn ?? this.basedOn,
        partOf: partOf ?? this.partOf,
        status: status ?? this.status,
        category: category ?? this.category,
        code: code ?? this.code,
        subject: subject ?? this.subject,
        encounter: encounter ?? this.encounter,
        effectiveDateTime: effectiveDateTime ?? this.effectiveDateTime,
        effectivePeriod: effectivePeriod ?? this.effectivePeriod,
        effectiveTiming: effectiveTiming ?? this.effectiveTiming,
        effectiveInstant: effectiveInstant ?? this.effectiveInstant,
        issued: issued ?? this.issued,
        valueQuantity: valueQuantity ?? this.valueQuantity,
        valueCodeableConcept: valueCodeableConcept ?? this.valueCodeableConcept,
        valueString: valueString ?? this.valueString,
        valueBoolean: valueBoolean ?? this.valueBoolean,
        valueInteger: valueInteger ?? this.valueInteger,
        valueRange: valueRange ?? this.valueRange,
        valueRatio: valueRatio ?? this.valueRatio,
        valueSampledData: valueSampledData ?? this.valueSampledData,
        valueTime: valueTime ?? this.valueTime,
        valueDateTime: valueDateTime ?? this.valueDateTime,
        valuePeriod: valuePeriod ?? this.valuePeriod,
        dataAbsentReason: dataAbsentReason ?? this.dataAbsentReason,
        interpretation: interpretation ?? this.interpretation,
        note: note ?? this.note,
        bodySite: bodySite ?? this.bodySite,
        method: method ?? this.method,
        specimen: specimen ?? this.specimen,
        device: device ?? this.device,
        referenceRange: referenceRange ?? this.referenceRange,
        hasMember: hasMember ?? this.hasMember,
        derivedFrom: derivedFrom ?? this.derivedFrom,
        component: component ?? this.component,
        complicatedBy: complicatedBy ?? this.complicatedBy,
        contextOfUse: contextOfUse ?? this.contextOfUse,
      );
}

class OperationOutcome<T> extends Resource implements Result<T> {
  OperationOutcome({
    this.text,
    this.issue,
  }) : super._internal(
          null,
          null,
        );

  factory OperationOutcome.fromJson(Map<String, dynamic> json) =>
      OperationOutcome(
        text: json['text'] != null
            ? Text.fromJson(json['text'] as Map<String, dynamic>)
            : null,
        issue: (json['issue'] as List<dynamic>?)
            ?.map((e) => Issue.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
      );

  final Text? text;
  final FixedList<Issue>? issue;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.operationOutcome.code,
        'text': text?.toJson(),
        'issue': issue?.map((e) => e.toJson()).toFixedList(),
      };
}

final class Organization extends Resource {
  Organization({
    required String id,
    required Meta? meta,
    this.identifier,
    this.type,
    this.name,
    this.total,
    this.link,
    this.entry,
    this.active,
    this.telecom,
    this.address,
  }) : super._internal(
          id,
          meta,
        );

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json['id'] as String,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        type: (json['type'] as List<dynamic>?)
            ?.map((e) => t.Type.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        name: json['name'] != null ? json['name'] as String? : null,
        total: json['total'] != null ? json['total'] as int? : null,
        link: (json['link'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        entry: (json['entry'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        active: json['active'] as bool?,
        telecom: (json['telecom'] as List<dynamic>?)
            ?.map((e) => Telecom.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        address: (json['address'] as List<dynamic>?)
            ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
      );

  final FixedList<t.Type>? type;
  final String? name;
  final int? total;
  final FixedList<Link>? link;
  final FixedList<Entry>? entry;
  final FixedList<Identifier>? identifier;
  final bool? active;
  final FixedList<Telecom>? telecom;
  final FixedList<Address>? address;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.organization.code,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toFixedList(),
        'type': type?.cast<dynamic>().toFixedList(),
        'name': name,
        'total': total,
        'link': link?.map((e) => e.toJson()).toFixedList(),
        'entry': entry?.map((e) => e.toJson()).toFixedList(),
        'active': active,
        'telecom': telecom?.map((e) => e.toJson()).toFixedList(),
        'address': address?.map((e) => e.toJson()).toFixedList(),
      };
}

class Patient extends Resource {
  Patient({
    String? id,
    Meta? meta,
    this.identifier,
    this.active,
    this.name,
    this.telecom,
    this.gender,
    this.birthDate,
    this.address,
  }) : super._internal(id, meta);

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json['id'] as String?,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        active: json['active'] as bool?,
        name: (json['name'] as List<dynamic>?)
            ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        telecom: (json['telecom'] as List<dynamic>?)
            ?.map((e) => Telecom.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        gender: json['gender'] != null
            ? AdministrativeGender.fromCode(json['gender'] as String)
            : null,
        birthDate: json['birthDate'] != null
            ? DateTime.parse(json['birthDate'] as String)
            : null,
        address: (json['address'] as List<dynamic>?)
            ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
      );

  final FixedList<Identifier>? identifier;
  final bool? active;
  final FixedList<Name>? name;
  final FixedList<Telecom>? telecom;
  final AdministrativeGender? gender;
  final DateTime? birthDate;
  final FixedList<Address>? address;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.patient.code,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toFixedList(),
        'active': active,
        'name': name?.map((e) => e.toJson()).toFixedList(),
        'telecom': telecom?.map((e) => e.toJson()).toFixedList(),
        'gender': gender?.code,
        'birthDate': birthDate?.toIso8601String(),
        'address': address?.map((e) => e.toJson()).toFixedList(),
      };
}

final class Practitioner extends Resource {
  Practitioner({
    required String id,
    required Meta? meta,
    required this.gender,
    this.identifier,
    this.type,
    this.name,
    this.total,
    this.link,
    this.entry,
    this.active,
    this.telecom,
    this.address,
  }) : super._internal(
          id,
          meta,
        );

  factory Practitioner.fromJson(Map<String, dynamic> json) => Practitioner(
        id: json['id'] as String,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        type: (json['type'] as List<dynamic>?)
            ?.map((e) => t.Type.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        name: (json['name'] as List<dynamic>?)
            ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        total: json['total'] != null ? json['total'] as int? : null,
        link: (json['link'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        entry: (json['entry'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        active: json['active'] as bool?,
        telecom: (json['telecom'] as List<dynamic>?)
            ?.map((e) => Telecom.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        address: (json['address'] as List<dynamic>?)
            ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        gender: AdministrativeGender.fromCode(
          json['gender'] as String? ?? 'unknown',
        ),
      );

  final FixedList<t.Type>? type;
  final FixedList<Name>? name;
  final int? total;
  final FixedList<Link>? link;
  final FixedList<Entry>? entry;
  final FixedList<Identifier>? identifier;
  final bool? active;
  final FixedList<Telecom>? telecom;
  final FixedList<Address>? address;
  final AdministrativeGender gender;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.practitioner.code,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toFixedList(),
        'type': type?.cast<dynamic>().toFixedList(),
        'name': name?.map((e) => e.toJson()).toFixedList(),
        'total': total,
        'link': link?.map((e) => e.toJson()).toFixedList(),
        'entry': entry?.map((e) => e.toJson()).toFixedList(),
        'active': active,
        'telecom': telecom?.map((e) => e.toJson()).toFixedList(),
        'address': address?.map((e) => e.toJson()).toFixedList(),
        'gender': gender.code,
      };
}

final class PractitionerRole extends Resource {
  PractitionerRole({
    required String id,
    required Meta? meta,
    this.extension,
    this.identifier,
    this.active,
    this.name,
    this.period,
    this.practitioner,
    this.code,
    this.specialty,
    this.location,
    this.availableTime,
  }) : super._internal(
          id,
          meta,
        );

  factory PractitionerRole.fromJson(Map<String, dynamic> json) =>
      PractitionerRole(
        id: json['id'] as String,
        extension: (json['extension'] as List<dynamic>?)
            ?.map((e) => Extension.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        active: json['active'] != null ? json['active'] as bool? : null,
        name: json['name'] != null ? json['name'] as String? : null,
        period: json['period'] != null
            ? Period.fromJson(json['period'] as Map<String, dynamic>)
            : null,
        practitioner: json['practitioner'] != null
            ? Reference.fromJson(json['practitioner'] as Map<String, dynamic>)
            : null,
        code: (json['code'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        specialty: (json['specialty'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        location: (json['location'] as List<dynamic>?)
            ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        availableTime: (json['availableTime'] as List<dynamic>?)
            ?.map((e) => AvailableTime.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
      );

  final FixedList<Extension>? extension;
  final FixedList<Identifier>? identifier;
  final bool? active;
  final String? name;
  final Period? period;
  final Reference? practitioner;
  final FixedList<CodeableConcept>? code;
  final FixedList<CodeableConcept>? specialty;
  final FixedList<Location>? location;
  final FixedList<AvailableTime>? availableTime;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.practitionerRole.code,
        'id': id,
        'extension': extension?.map((e) => e.toJson()).toFixedList(),
        'identifier': identifier?.map((e) => e.toJson()).toFixedList(),
        'active': active,
        'name': name,
        'period': period?.toJson(),
        'practitioner': practitioner?.toJson(),
        'code': code?.map((e) => e.toJson()).toFixedList(),
        'specialty': specialty?.map((e) => e.toJson()).toFixedList(),
        'location': location?.map((e) => e.toJson()).toFixedList(),
        'availableTime': availableTime?.map((e) => e.toJson()).toFixedList(),
      };
}

class Slot extends Resource {
  Slot({
    String? id,
    Meta? meta,
    this.identifier,
    this.serviceCategory,
    this.serviceType,
    this.specialty,
    this.appointmentType,
    this.status,
    this.start,
    this.end,
    this.comment,
  }) : super._internal(
          id,
          meta,
        );

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        id: json['id'] != null ? json['id'] as String? : null,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        serviceCategory: (json['serviceCategory'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        serviceType: (json['serviceType'] as List<dynamic>?)
            ?.map((e) => CodeableReference.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        specialty: (json['specialty'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        appointmentType: json['appointmentType'] != null
            ? CodeableConcept.fromJson(
                json['appointmentType'] as Map<String, dynamic>,
              )
            : null,
        status: json['status'] != null ? json['status'] as String? : null,
        start: DateTime.tryParse(json['start'] as String? ?? ''),
        end: DateTime.tryParse(json['end'] as String? ?? ''),
        comment: json['comment'] != null ? json['comment'] as String? : null,
      );

  final FixedList<Identifier>? identifier;
  final FixedList<CodeableConcept>? serviceCategory;
  final FixedList<CodeableReference>? serviceType;
  final FixedList<CodeableConcept>? specialty;
  final CodeableConcept? appointmentType;
  final String? status;
  final DateTime? start;
  final DateTime? end;
  final String? comment;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.slot.code,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toFixedList(),
        'serviceCategory':
            serviceCategory?.map((e) => e.toJson()).toFixedList(),
        'serviceType': serviceType?.map((e) => e.toJson()).toFixedList(),
        'specialty': specialty?.map((e) => e.toJson()).toFixedList(),
        'appointmentType': appointmentType?.toJson(),
        'status': status,
        'start': start.toString(),
        'end': end.toString(),
        'comment': comment,
      };
}

class Schedule extends Resource {
  Schedule({
    String? id,
    Meta? meta,
    this.active,
    this.identifier,
    this.serviceType,
    this.serviceCategory,
    this.specialty,
    this.actor,
    this.planningHorizon,
    this.comment,
  }) : super._internal(
          id,
          meta,
        );

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json['id'] != null ? json['id'] as String? : null,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        active: json['active'] as bool?,
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        serviceType: (json['serviceType'] as List<dynamic>?)
            ?.map((e) => CodeableReference.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        serviceCategory: (json['serviceCategory'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        specialty: (json['specialty'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        actor: (json['actor'] as List<dynamic>?)
            ?.map((e) => Actor.fromJson(e as Map<String, dynamic>))
            .toFixedList(),
        planningHorizon: json['planningHorizon'] != null
            ? PlanningHorizon.fromJson(
                json['planningHorizon'] as Map<String, dynamic>,
              )
            : null,
        comment: json['comment'] != null ? json['comment'] as String? : null,
      );

  final FixedList<Identifier>? identifier;
  final FixedList<CodeableReference>? serviceType;
  final FixedList<CodeableConcept>? serviceCategory;
  final FixedList<CodeableConcept>? specialty;
  final FixedList<Actor>? actor;
  final PlanningHorizon? planningHorizon;
  final String? comment;
  final bool? active;

  Map<String, dynamic> toJson() => {
        'resourceType': ResourceType.schedule.code,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toFixedList(),
        'serviceType': serviceType?.map((e) => e.toJson()).toFixedList(),
        'serviceCategory': serviceType?.map((e) => e.toJson()).toFixedList(),
        'specialty': specialty?.map((e) => e.toJson()).toFixedList(),
        'actor': actor?.map((e) => e.toJson()).toFixedList(),
        'planningHorizon': planningHorizon?.toJson(),
        'comment': comment,
        'active': active,
      };
}

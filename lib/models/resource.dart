// ignore_for_file: lines_longer_than_80_chars, comment_references

import 'package:fhir_client/models/actor.dart';
import 'package:fhir_client/models/address.dart';
import 'package:fhir_client/models/admit_source.dart';
import 'package:fhir_client/models/annotation.dart';
import 'package:fhir_client/models/available_time.dart';
import 'package:fhir_client/models/basic_types/field_definition.dart';
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

  /// The id of the resource
  Definable<String> get id => getValue(Resource.idField.name);

  /// The metadata of the resource
  Definable<Meta> get meta => getValue(Resource.metaField.name);

  static const idField = FieldDefinition(name: 'id', getValue: _getId);
  static const metaField = FieldDefinition(name: 'meta', getValue: _getMeta);

  static const fieldDefinitions = [
    idField,
    metaField,
  ];

  static Definable<String> _getId(JsonObject jo) => jo.getValue(idField.name);

  static Definable<Meta> _getMeta(JsonObject jo) => jo.getValue(metaField.name);
}

/// A booking of a healthcare event among patient(s), practitioner(s), related person(s) and/or device(s) for a specific date/time.
class Appointment extends Resource {
  /// Constructs a new [Appointment].
  Appointment({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<String> status = const Undefined(),
    Definable<FixedList<CodeableConcept>> serviceCategory = const Undefined(),
    Definable<FixedList<Participant>> participant = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (status is Defined<String>) status.toMapEntry(),
            if (serviceCategory is Defined<FixedList<CodeableConcept>>)
              serviceCategory.toMapEntry(),
            if (participant is Defined<FixedList<Participant>>)
              participant.toMapEntry(),
          ]),
        );

  /// Creates an [Appointment] instance from the provided JSON object.
  Appointment.fromJson(super.json) : super._internal();

  /// The overall status of the appointment.
  Definable<String> get status => statusField.getValue(this);

  /// A broad categorization of the service that is to be performed during this appointment.
  Definable<FixedList<CodeableConcept>> get serviceCategory =>
      serviceCategoryField.getValue(this);

  /// List of participants involved in the appointment.
  Definable<FixedList<Participant>> get participant =>
      participantField.getValue(this);

  /// Field definition for [status]
  static const statusField = FieldDefinition(
    name: 'status',
    getValue: _getStatus,
  );

  /// Field definition for [serviceCategory]
  static const serviceCategoryField = FieldDefinition(
    name: 'serviceCategory',
    getValue: _getServiceCategory,
  );

  /// Field definition for [participant]
  static const participantField = FieldDefinition(
    name: 'participant',
    getValue: _getParticipant,
  );

  static Definable<String> _getStatus(JsonObject jo) =>
      jo.getValue(statusField.name);

  static Definable<FixedList<CodeableConcept>> _getServiceCategory(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        serviceCategoryField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Participant>> _getParticipant(JsonObject jo) =>
      jo.getValueFromObjectArray(
        participantField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Participant.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// All field definitions for [Appointment]
  static const fieldDefinitions = [
    statusField,
    serviceCategoryField,
    participantField,
  ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Appointment &&
          other.id == id &&
          other.meta == meta &&
          other.status == status &&
          other.serviceCategory == serviceCategory &&
          other.participant == participant);

  @override
  int get hashCode =>
      id.hashCode ^
      meta.hashCode ^
      status.hashCode ^
      serviceCategory.hashCode ^
      participant.hashCode;

  /// Creates a copy of the [Appointment] instance and allows
  /// for non-destructive mutation.
  Appointment copyWith({
    Definable<String>? status,
    Definable<FixedList<CodeableConcept>>? serviceCategory,
    Definable<FixedList<Participant>>? participant,
    Definable<String>? id,
    Definable<Meta>? meta,
  }) =>
      Appointment(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        status: status ?? this.status,
        serviceCategory: serviceCategory ?? this.serviceCategory,
        participant: participant ?? this.participant,
      );
}

/// A container for a collection of resources.
class Bundle extends Resource {
  /// Constructs a new [Bundle].
  Bundle({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<FixedList<Extension>> extension = const Undefined(),
    Definable<FixedList<Identifier>> identifier = const Undefined(),
    Definable<bool> active = const Undefined(),
    Definable<String> type = const Undefined(),
    Definable<String> name = const Undefined(),
    Definable<FixedList<CodeableConcept>> code = const Undefined(),
    Definable<FixedList<Location>> location = const Undefined(),
    Definable<FixedList<Link>> link = const Undefined(),
    Definable<FixedList<Entry>> entry = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (extension is Defined<FixedList<Extension>>)
              extension.toMapEntry(),
            if (identifier is Defined<FixedList<Identifier>>)
              identifier.toMapEntry(),
            if (active is Defined<bool>) active.toMapEntry(),
            if (type is Defined<String>) type.toMapEntry(),
            if (name is Defined<String>) name.toMapEntry(),
            if (code is Defined<FixedList<CodeableConcept>>) code.toMapEntry(),
            if (location is Defined<FixedList<Location>>) location.toMapEntry(),
            if (link is Defined<FixedList<Link>>) link.toMapEntry(),
            if (entry is Defined<FixedList<Entry>>) entry.toMapEntry(),
          ]),
        );

  /// Creates a [Bundle] instance from the provided JSON object.
  Bundle.fromJson(super.json) : super._internal();

  /// Additional content defined by implementations.
  Definable<FixedList<Extension>> get extension =>
      extensionField.getValue(this);

  /// Persistent identifier for the bundle.
  Definable<FixedList<Identifier>> get identifier =>
      identifierField.getValue(this);

  /// Indicates whether the bundle is currently in active use.
  Definable<bool> get active => activeField.getValue(this);

  /// Indicates the purpose of the bundle.
  Definable<String> get type => typeField.getValue(this);

  /// A name for the bundle.
  Definable<String> get name => nameField.getValue(this);

  /// A code that identifies the type of bundle.
  Definable<FixedList<CodeableConcept>> get code => codeField.getValue(this);

  /// The location(s) where the bundle was assembled.
  Definable<FixedList<Location>> get location => locationField.getValue(this);

  /// A series of links that provide context to the bundle.
  Definable<FixedList<Link>> get link => linkField.getValue(this);

  /// An entry in the bundle - will have a resource or information.
  Definable<FixedList<Entry>> get entry => entryField.getValue(this);

  /// Field definition for [extension]
  static const extensionField = FieldDefinition(
    name: 'extension',
    getValue: _getExtension,
  );

  /// Field definition for [identifier]
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [active]
  static const activeField = FieldDefinition(
    name: 'active',
    getValue: _getActive,
  );

  /// Field definition for [type]
  static const typeField = FieldDefinition(
    name: 'type',
    getValue: _getType,
  );

  /// Field definition for [name]
  static const nameField = FieldDefinition(
    name: 'name',
    getValue: _getName,
  );

  /// Field definition for [code]
  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  /// Field definition for [location]
  static const locationField = FieldDefinition(
    name: 'location',
    getValue: _getLocation,
  );

  /// Field definition for [link]
  static const linkField = FieldDefinition(
    name: 'link',
    getValue: _getLink,
  );

  /// Field definition for [entry]
  static const entryField = FieldDefinition(
    name: 'entry',
    getValue: _getEntry,
  );

  static Definable<FixedList<Extension>> _getExtension(JsonObject jo) =>
      jo.getValueFromObjectArray(
        extensionField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Extension.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Identifier>> _getIdentifier(JsonObject jo) =>
      jo.getValueFromObjectArray(
        identifierField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<bool> _getActive(JsonObject jo) =>
      jo.getValue(activeField.name);

  static Definable<String> _getType(JsonObject jo) =>
      jo.getValue(typeField.name);

  static Definable<String> _getName(JsonObject jo) =>
      jo.getValue(nameField.name);

  static Definable<FixedList<CodeableConcept>> _getCode(JsonObject jo) =>
      jo.getValueFromObjectArray(
        codeField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Location>> _getLocation(JsonObject jo) =>
      jo.getValueFromObjectArray(
        locationField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Location.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Link>> _getLink(JsonObject jo) =>
      jo.getValueFromObjectArray(
        linkField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Link.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Entry>> _getEntry(JsonObject jo) =>
      jo.getValueFromObjectArray(
        entryField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Entry.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  /// All field definitions for [Bundle]
  static const fieldDefinitions = [
    extensionField,
    identifierField,
    activeField,
    typeField,
    nameField,
    codeField,
    locationField,
    linkField,
    entryField,
  ];
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bundle &&
          other.id == id &&
          other.meta == meta &&
          other.extension == extension &&
          other.identifier == identifier &&
          other.active == active &&
          other.type == type &&
          other.name == name &&
          other.code == code &&
          other.location == location &&
          other.link == link &&
          other.entry == entry);

  @override
  int get hashCode =>
      id.hashCode ^
      meta.hashCode ^
      extension.hashCode ^
      identifier.hashCode ^
      active.hashCode ^
      type.hashCode ^
      name.hashCode ^
      code.hashCode ^
      location.hashCode ^
      link.hashCode ^
      entry.hashCode;

  /// Creates a copy of the [Bundle] instance and allows
  /// for non-destructive mutation.
  Bundle copyWith({
    Definable<String>? id,
    Definable<Meta>? meta,
    Definable<FixedList<Extension>>? extension,
    Definable<FixedList<Identifier>>? identifier,
    Definable<bool>? active,
    Definable<String>? type,
    Definable<String>? name,
    Definable<FixedList<CodeableConcept>>? code,
    Definable<FixedList<Location>>? location,
    Definable<FixedList<Link>>? link,
    Definable<FixedList<Entry>>? entry,
  }) =>
      Bundle(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        extension: extension ?? this.extension,
        identifier: identifier ?? this.identifier,
        active: active ?? this.active,
        type: type ?? this.type,
        name: name ?? this.name,
        code: code ?? this.code,
        location: location ?? this.location,
        link: link ?? this.link,
        entry: entry ?? this.entry,
      );
}

/// An interaction between a patient and healthcare provider(s) for the purpose of providing healthcare service(s) or assessing the health status of a patient.
class Encounter extends Resource {
  /// Constructs a new [Encounter].
  Encounter({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<FixedList<Identifier>> identifier = const Undefined(),
    Definable<String> status = const Undefined(),
    Definable<CodeableConcept> classCode = const Undefined(),
    Definable<FixedList<CodeableConcept>> type = const Undefined(),
    Definable<CodeableConcept> serviceType = const Undefined(),
    Definable<CodeableConcept> priority = const Undefined(),
    Definable<Reference> subject = const Undefined(),
    Definable<FixedList<Participant>> participant = const Undefined(),
    Definable<Period> period = const Undefined(),
    Definable<Duration> length = const Undefined(),
    Definable<FixedList<CodeableConcept>> reasonCode = const Undefined(),
    Definable<Hospitalization> hospitalization = const Undefined(),
    Definable<FixedList<Reference>> location = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (identifier is Defined<FixedList<Identifier>>)
              identifier.toMapEntry(),
            if (status is Defined<String>) status.toMapEntry(),
            if (classCode is Defined<CodeableConcept>) classCode.toMapEntry(),
            if (type is Defined<FixedList<CodeableConcept>>) type.toMapEntry(),
            if (serviceType is Defined<CodeableConcept>)
              serviceType.toMapEntry(),
            if (priority is Defined<CodeableConcept>) priority.toMapEntry(),
            if (subject is Defined<Reference>) subject.toMapEntry(),
            if (participant is Defined<FixedList<Participant>>)
              participant.toMapEntry(),
            if (period is Defined<Period>) period.toMapEntry(),
            if (length is Defined<Duration>) length.toMapEntry(),
            if (reasonCode is Defined<FixedList<CodeableConcept>>)
              reasonCode.toMapEntry(),
            if (hospitalization is Defined<Hospitalization>)
              hospitalization.toMapEntry(),
            if (location is Defined<FixedList<Reference>>)
              location.toMapEntry(),
          ]),
        );

  /// Creates an [Encounter] instance from the provided JSON object.
  Encounter.fromJson(super.json) : super._internal();

  /// Identifier(s) by which this encounter is known.
  Definable<FixedList<Identifier>> get identifier =>
      identifierField.getValue(this);

  /// The current status of the encounter.
  Definable<String> get status => statusField.getValue(this);

  /// Classification of patient encounter context - e.g. Inpatient, outpatient.
  Definable<CodeableConcept> get classCode => classField.getValue(this);

  /// Specific type of encounter (e.g. e-mail consultation, surgical day-care, skilled nursing, rehabilitation).
  Definable<FixedList<CodeableConcept>> get type => typeField.getValue(this);

  /// Broad categorization of the service that is to be provided (e.g. cardiology).
  Definable<CodeableConcept> get serviceType => serviceTypeField.getValue(this);

  /// Indicates the urgency of the encounter.
  Definable<CodeableConcept> get priority => priorityField.getValue(this);

  /// The patient or group present at the encounter.
  Definable<Reference> get subject => subjectField.getValue(this);

  /// The list of people responsible for providing the service.
  Definable<FixedList<Participant>> get participant =>
      participantField.getValue(this);

  /// The start and end time of the encounter.
  Definable<Period> get period => periodField.getValue(this);

  /// Quantity of time the encounter lasted. This excludes the time during leaves of absence.
  Definable<Duration> get length => lengthField.getValue(this);

  /// Reason the encounter takes place, expressed as a code. For admissions, this can be used for a coded admission diagnosis.
  Definable<FixedList<CodeableConcept>> get reasonCode =>
      reasonCodeField.getValue(this);

  /// Details about the admission to a healthcare service.
  Definable<Hospitalization> get hospitalization =>
      hospitalizationField.getValue(this);

  /// List of locations where the patient has been during this encounter.
  Definable<FixedList<Reference>> get location => locationField.getValue(this);

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [status].
  static const statusField = FieldDefinition(
    name: 'status',
    getValue: _getStatus,
  );

  /// Field definition for [classCode].
  static const classField = FieldDefinition(
    name: 'class',
    getValue: _getClassCode,
  );

  /// Field definition for [type].
  static const typeField = FieldDefinition(
    name: 'type',
    getValue: _getType,
  );

  /// Field definition for [serviceType].
  static const serviceTypeField = FieldDefinition(
    name: 'serviceType',
    getValue: _getServiceType,
  );

  /// Field definition for [priority].
  static const priorityField = FieldDefinition(
    name: 'priority',
    getValue: _getPriority,
  );

  /// Field definition for [subject].
  static const subjectField = FieldDefinition(
    name: 'subject',
    getValue: _getSubject,
  );

  /// Field definition for [participant].
  static const participantField = FieldDefinition(
    name: 'participant',
    getValue: _getParticipant,
  );

  /// Field definition for [period].
  static const periodField = FieldDefinition(
    name: 'period',
    getValue: _getPeriod,
  );

  /// Field definition for [length].
  static const lengthField = FieldDefinition(
    name: 'length',
    getValue: _getLength,
  );

  /// Field definition for [reasonCode].
  static const reasonCodeField = FieldDefinition(
    name: 'reasonCode',
    getValue: _getReasonCode,
  );

  /// Field definition for [hospitalization].
  static const hospitalizationField = FieldDefinition(
    name: 'hospitalization',
    getValue: _getHospitalization,
  );

  /// Field definition for [location].
  static const locationField = FieldDefinition(
    name: 'location',
    getValue: _getLocation,
  );

  /// All field definitions for [Encounter].
  static const fieldDefinitions = [
    identifierField,
    statusField,
    classField,
    typeField,
    serviceTypeField,
    priorityField,
    subjectField,
    participantField,
    periodField,
    lengthField,
    reasonCodeField,
    hospitalizationField,
    locationField,
  ];

  static Definable<FixedList<Identifier>> _getIdentifier(JsonObject jo) =>
      jo.getValueFromObjectArray(
        identifierField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<String> _getStatus(JsonObject jo) =>
      jo.getValue(statusField.name);

  static Definable<CodeableConcept> _getClassCode(JsonObject jo) =>
      jo.getValueFromObjectArray(
        classField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<FixedList<CodeableConcept>> _getType(JsonObject jo) =>
      jo.getValueFromObjectArray(
        typeField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<CodeableConcept> _getServiceType(JsonObject jo) =>
      jo.getValueFromObjectArray(
        serviceTypeField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<CodeableConcept> _getPriority(JsonObject jo) =>
      jo.getValueFromObjectArray(
        priorityField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Reference> _getSubject(JsonObject jo) =>
      jo.getValueFromObjectArray(
        subjectField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<FixedList<Participant>> _getParticipant(JsonObject jo) =>
      jo.getValueFromObjectArray(
        participantField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Participant.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<Period> _getPeriod(JsonObject jo) =>
      jo.getValueFromObjectArray(
        periodField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Period.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Duration> _getLength(JsonObject jo) => jo.getValueFromString(
        lengthField.name,
        tryParse: (t) =>
            t != null ? Duration(milliseconds: int.parse(t) * 1000) : null,
      );

  static Definable<FixedList<CodeableConcept>> _getReasonCode(JsonObject jo) =>
      jo.getValueFromObjectArray(
        reasonCodeField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<Hospitalization> _getHospitalization(JsonObject jo) =>
      jo.getValueFromObjectArray(
        hospitalizationField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Hospitalization.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<FixedList<Reference>> _getLocation(JsonObject jo) =>
      jo.getValueFromObjectArray(
        locationField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Encounter &&
          other.identifier == identifier &&
          other.status == status &&
          other.classCode == classCode &&
          other.type == type &&
          other.serviceType == serviceType &&
          other.priority == priority &&
          other.subject == subject &&
          other.participant == participant &&
          other.period == period &&
          other.length == length &&
          other.reasonCode == reasonCode &&
          other.hospitalization == hospitalization &&
          other.location == location);

  @override
  int get hashCode => Object.hash(
        identifier,
        status,
        classCode,
        type,
        serviceType,
        priority,
        subject,
        participant,
        period,
        length,
        reasonCode,
        hospitalization,
        location,
      );
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
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (identifier is Defined<FixedList<Identifier>>)
              identifier.toMapEntry(),
            if (basedOn is Defined<FixedList<Reference>>) basedOn.toMapEntry(),
            if (partOf is Defined<FixedList<Reference>>) partOf.toMapEntry(),
            if (status is Defined<String>) status.toMapEntry(),
            if (category is Defined<FixedList<CodeableConcept>>)
              category.toMapEntry(),
            if (code is Defined<CodeableConcept>) code.toMapEntry(),
            if (subject is Defined<Reference>) subject.toMapEntry(),
            if (encounter is Defined<Reference>) encounter.toMapEntry(),
            if (effectiveDateTime is Defined<DateTime>)
              effectiveDateTime.toMapEntry(),
            if (effectivePeriod is Defined<Period>)
              effectivePeriod.toMapEntry(),
            if (effectiveTiming is Defined<Timing>)
              effectiveTiming.toMapEntry(),
            if (effectiveInstant is Defined<DateTime>)
              effectiveInstant.toMapEntry(),
            if (issued is Defined<DateTime>) issued.toMapEntry(),
            if (valueQuantity is Defined<Quantity>) valueQuantity.toMapEntry(),
            if (valueCodeableConcept is Defined<CodeableConcept>)
              valueCodeableConcept.toMapEntry(),
            if (valueString is Defined<String>) valueString.toMapEntry(),
            if (valueBoolean is Defined<bool>) valueBoolean.toMapEntry(),
            if (valueInteger is Defined<int>) valueInteger.toMapEntry(),
            if (valueRange is Defined<Range>) valueRange.toMapEntry(),
            if (valueRatio is Defined<Ratio>) valueRatio.toMapEntry(),
            if (valueSampledData is Defined<SampledData>)
              valueSampledData.toMapEntry(),
            if (valueTime is Defined<Time>) valueTime.toMapEntry(),
            if (valueDateTime is Defined<DateTime>) valueDateTime.toMapEntry(),
            if (valuePeriod is Defined<Period>) valuePeriod.toMapEntry(),
            if (dataAbsentReason is Defined<CodeableConcept>)
              dataAbsentReason.toMapEntry(),
            if (interpretation is Defined<FixedList<CodeableConcept>>)
              interpretation.toMapEntry(),
            if (note is Defined<FixedList<Annotation>>) note.toMapEntry(),
            if (bodySite is Defined<CodeableConcept>) bodySite.toMapEntry(),
            if (method is Defined<CodeableConcept>) method.toMapEntry(),
            if (specimen is Defined<Reference>) specimen.toMapEntry(),
            if (device is Defined<Reference>) device.toMapEntry(),
            if (referenceRange is Defined<FixedList<ObservationReferenceRange>>)
              referenceRange.toMapEntry(),
            if (hasMember is Defined<FixedList<Reference>>)
              hasMember.toMapEntry(),
            if (derivedFrom is Defined<FixedList<Reference>>)
              derivedFrom.toMapEntry(),
            if (component is Defined<FixedList<ObservationComponent>>)
              component.toMapEntry(),
            if (complicatedBy is Defined<FixedList<CodeableReference>>)
              complicatedBy.toMapEntry(),
            if (contextOfUse is Defined<FixedList<CodeableReference>>)
              contextOfUse.toMapEntry(),
          ]),
        );

  /// Creates an [Observation] instance from the provided JSON object.
  Observation.fromJson(super.json) : super._internal();

  /// Business identifier for this observation.
  ///
  /// Type: List<Identifier>
  /// Path: Observation.identifier
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Identifier>> get identifier =>
      identifierField.getValue(this);

  /// A plan, proposal or order that is fulfilled in whole or in part by this event.
  ///
  /// Type: List<Reference>
  /// Path: Observation.basedOn
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Reference>> get basedOn => basedOnField.getValue(this);

  /// A larger event of which this particular observation is a component or step.
  ///
  /// Type: List<Reference>
  /// Path: Observation.partOf
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Reference>> get partOf => partOfField.getValue(this);

  /// The status of the result value.
  ///
  /// Type: CodeType
  /// Path: Observation.status
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  Definable<String> get status => statusField.getValue(this);

  /// A code that classifies the general type of observation being made.
  ///
  /// Type: List<CodeableConcept>
  /// Path: Observation.category
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<CodeableConcept>> get category =>
      categoryField.getValue(this);

  /// Type of observation (code / type).
  ///
  /// Type: CodeableConcept
  /// Path: Observation.code
  /// Minimum Cardinality: 1
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get code => codeField.getValue(this);

  /// The patient, or group of patients, location, or device this observation is about and into whose record the observation is placed. If the actual focus of the observation is different from the subject (or a sample of, part, or region of the subject), the `focus` element or the `code` itself specifies the actual focus of the observation.
  ///
  /// Type: Reference
  /// Path: Observation.subject
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Reference> get subject => subjectField.getValue(this);

  /// The healthcare event (e.g. a patient and healthcare provider interaction) during which this observation is made.
  ///
  /// Type: Reference
  /// Path: Observation.encounter
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Reference> get encounter => encounterField.getValue(this);

  /// The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the "physiologically relevant time". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself.
  ///
  /// Type: DateTimeType
  /// Path: Observation.effective[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get effectiveDateTime =>
      effectiveDateTimeField.getValue(this);

  /// The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the "physiologically relevant time". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself.
  ///
  /// Type: Period
  /// Path: Observation.effective[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Period> get effectivePeriod => effectivePeriodField.getValue(this);

  /// The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the "physiologically relevant time". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself.
  ///
  /// Type: Timing
  /// Path: Observation.effective[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Timing> get effectiveTiming => effectiveTimingField.getValue(this);

  /// The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the "physiologically relevant time". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself.
  ///
  /// Type: InstantType
  /// Path: Observation.effective[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get effectiveInstant =>
      effectiveInstantField.getValue(this);

  /// The date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified.
  ///
  /// Type: InstantType
  /// Path: Observation.issued
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get issued => issuedField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: Quantity
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Quantity> get valueQuantity => valueQuantityField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: CodeableConcept
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get valueCodeableConcept =>
      valueCodeableConceptField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: StringType
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<String> get valueString => valueStringField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: BooleanType
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<bool> get valueBoolean => valueBooleanField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: IntegerType
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<int> get valueInteger => valueIntegerField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: Range
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Range> get valueRange => valueRangeField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: Ratio
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Ratio> get valueRatio => valueRatioField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: SampledData
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<SampledData> get valueSampledData =>
      valueSampledDataField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: TimeType
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Time> get valueTime => valueTimeField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: DateTimeType
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<DateTime> get valueDateTime => valueDateTimeField.getValue(this);

  /// The information determined as a result of making the observation, if the information has a simple value.
  ///
  /// Type: Period
  /// Path: Observation.value[x]
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Period> get valuePeriod => valuePeriodField.getValue(this);

  /// Provides a reason why the expected value in the element Observation.value[x] is missing.
  ///
  /// Type: CodeableConcept
  /// Path: Observation.dataAbsentReason
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get dataAbsentReason =>
      dataAbsentReasonField.getValue(this);

  /// A categorical assessment of an observation value. This is often used to supply a "normal" range categorization for numeric values.
  ///
  /// Type: List<CodeableConcept>
  /// Path: Observation.interpretation
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<CodeableConcept>> get interpretation =>
      interpretationField.getValue(this);

  /// Comments about the observation or the results.
  ///
  /// Type: List<Annotation>
  /// Path: Observation.note
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Annotation>> get note => noteField.getValue(this);

  /// Indicates the site on the subject's body where the observation was made (i.e. the target site).
  ///
  /// Type: CodeableConcept
  /// Path: Observation.bodySite
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get bodySite => bodySiteField.getValue(this);

  /// Indicates the mechanism used to perform the observation.
  ///
  /// Type: CodeableConcept
  /// Path: Observation.method
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<CodeableConcept> get method => methodField.getValue(this);

  /// The specimen that was used when this observation was made.
  ///
  /// Type: Reference
  /// Path: Observation.specimen
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Reference> get specimen => specimenField.getValue(this);

  /// The device used to generate the observation data.
  ///
  /// Type: Reference
  /// Path: Observation.device
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: 1
  Definable<Reference> get device => deviceField.getValue(this);

  /// Guidance on how to interpret the value by comparison to a normal or recommended range.
  ///
  /// Type: List<ObservationReferenceRange>
  /// Path: Observation.referenceRange
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<ObservationReferenceRange>> get referenceRange =>
      referenceRangeField.getValue(this);

  /// This observation is a group observation (e.g. a battery, a panel of tests, a set of vital sign measurements) that includes the target as a member of the group.
  ///
  /// Type: List<Reference>
  /// Path: Observation.hasMember
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Reference>> get hasMember =>
      hasMemberField.getValue(this);

  /// The target resource that represents a measurement from which this observation value is derived. For example, a calculated anion gap or a fetal measurement based on an ultrasound image.
  ///
  /// Type: List<Reference>
  /// Path: Observation.derivedFrom
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<Reference>> get derivedFrom =>
      derivedFromField.getValue(this);

  /// Some observations have multiple component observations. These component observations are expressed as separate code value pairs that share the same attributes. Examples include systolic and diastolic component observations for blood pressure measurement and multiple component observations for genetics observations.
  ///
  /// Type: List<ObservationComponent>
  /// Path: Observation.component
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<ObservationComponent>> get component =>
      componentField.getValue(this);

  /// The complications or conditions that interfere with the interpretation of the observation.
  ///
  /// Type: List<CodeableReference>
  /// Path: Observation.complicatedBy
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<CodeableReference>> get complicatedBy =>
      complicatedByField.getValue(this);

  /// Details the use context for the Observation, if appropriate.
  ///
  /// Type: List<CodeableReference>
  /// Path: Observation.contextOfUse
  /// Minimum Cardinality: 0
  /// Maximum Cardinality: *
  Definable<FixedList<CodeableReference>> get contextOfUse =>
      contextOfUseField.getValue(this);

  /// Field definition for [identifier]
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [basedOn]
  static const basedOnField = FieldDefinition(
    name: 'basedOn',
    getValue: _getBasedOn,
  );

  /// Field definition for [partOf]
  static const partOfField = FieldDefinition(
    name: 'partOf',
    getValue: _getPartOf,
  );

  /// Field definition for [status]
  static const statusField = FieldDefinition(
    name: 'status',
    getValue: _getStatus,
  );

  /// Field definition for [category]
  static const categoryField = FieldDefinition(
    name: 'category',
    getValue: _getCategory,
  );

  /// Field definition for [code]
  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  /// Field definition for [subject]
  static const subjectField = FieldDefinition(
    name: 'subject',
    getValue: _getSubject,
  );

  /// Field definition for [encounter]
  static const encounterField = FieldDefinition(
    name: 'encounter',
    getValue: _getEncounter,
  );

  /// Field definition for [effectiveDateTime]
  static const effectiveDateTimeField = FieldDefinition(
    name: 'effectiveDateTime',
    getValue: _getEffectiveDateTime,
  );

  /// Field definition for [effectivePeriod]
  static const effectivePeriodField = FieldDefinition(
    name: 'effectivePeriod',
    getValue: _getEffectivePeriod,
  );

  /// Field definition for [effectiveTiming]
  static const effectiveTimingField = FieldDefinition(
    name: 'effectiveTiming',
    getValue: _getEffectiveTiming,
  );

  /// Field definition for [effectiveInstant]
  static const effectiveInstantField = FieldDefinition(
    name: 'effectiveInstant',
    getValue: _getEffectiveInstant,
  );

  /// Field definition for [issued]
  static const issuedField = FieldDefinition(
    name: 'issued',
    getValue: _getIssued,
  );

  /// Field definition for [valueQuantity]
  static const valueQuantityField = FieldDefinition(
    name: 'valueQuantity',
    getValue: _getValueQuantity,
  );

  /// Field definition for [valueCodeableConcept]
  static const valueCodeableConceptField = FieldDefinition(
    name: 'valueCodeableConcept',
    getValue: _getValueCodeableConcept,
  );

  /// Field definition for [valueString]
  static const valueStringField = FieldDefinition(
    name: 'valueString',
    getValue: _getValueString,
  );

  /// Field definition for [valueBoolean]
  static const valueBooleanField = FieldDefinition(
    name: 'valueBoolean',
    getValue: _getValueBoolean,
  );

  /// Field definition for [valueInteger]
  static const valueIntegerField = FieldDefinition(
    name: 'valueInteger',
    getValue: _getValueInteger,
  );

  /// Field definition for [valueRange]
  static const valueRangeField = FieldDefinition(
    name: 'valueRange',
    getValue: _getValueRange,
  );

  /// Field definition for [valueRatio]
  static const valueRatioField = FieldDefinition(
    name: 'valueRatio',
    getValue: _getValueRatio,
  );

  /// Field definition for [valueSampledData]
  static const valueSampledDataField = FieldDefinition(
    name: 'valueSampledData',
    getValue: _getValueSampledData,
  );

  /// Field definition for [valueTime]
  static const valueTimeField = FieldDefinition(
    name: 'valueTime',
    getValue: _getValueTime,
  );

  /// Field definition for [valueDateTime]
  static const valueDateTimeField = FieldDefinition(
    name: 'valueDateTime',
    getValue: _getValueDateTime,
  );

  /// Field definition for [valuePeriod]
  static const valuePeriodField = FieldDefinition(
    name: 'valuePeriod',
    getValue: _getValuePeriod,
  );

  /// Field definition for [dataAbsentReason]
  static const dataAbsentReasonField = FieldDefinition(
    name: 'dataAbsentReason',
    getValue: _getDataAbsentReason,
  );

  /// Field definition for [interpretation]
  static const interpretationField = FieldDefinition(
    name: 'interpretation',
    getValue: _getInterpretation,
  );

  /// Field definition for [note]
  static const noteField = FieldDefinition(
    name: 'note',
    getValue: _getNote,
  );

  /// Field definition for [bodySite]
  static const bodySiteField = FieldDefinition(
    name: 'bodySite',
    getValue: _getBodySite,
  );

  /// Field definition for [method]
  static const methodField = FieldDefinition(
    name: 'method',
    getValue: _getMethod,
  );

  /// Field definition for [specimen]
  static const specimenField = FieldDefinition(
    name: 'specimen',
    getValue: _getSpecimen,
  );

  /// Field definition for [device]
  static const deviceField = FieldDefinition(
    name: 'device',
    getValue: _getDevice,
  );

  /// Field definition for [referenceRange]
  static const referenceRangeField = FieldDefinition(
    name: 'referenceRange',
    getValue: _getReferenceRange,
  );

  /// Field definition for [hasMember]
  static const hasMemberField = FieldDefinition(
    name: 'hasMember',
    getValue: _getHasMember,
  );

  /// Field definition for [derivedFrom]
  static const derivedFromField = FieldDefinition(
    name: 'derivedFrom',
    getValue: _getDerivedFrom,
  );

  /// Field definition for [component]
  static const componentField = FieldDefinition(
    name: 'component',
    getValue: _getComponent,
  );

  /// Field definition for [complicatedBy]
  static const complicatedByField = FieldDefinition(
    name: 'complicatedBy',
    getValue: _getComplicatedBy,
  );

  /// Field definition for [contextOfUse]
  static const contextOfUseField = FieldDefinition(
    name: 'contextOfUse',
    getValue: _getContextOfUse,
  );

  /// All field definitions for [Observation].
  static const fieldDefinitions = [
    identifierField,
    basedOnField,
    partOfField,
    statusField,
    categoryField,
    codeField,
    subjectField,
    encounterField,
    effectiveDateTimeField,
    effectivePeriodField,
    effectiveTimingField,
    effectiveInstantField,
    issuedField,
    valueQuantityField,
    valueCodeableConceptField,
    valueStringField,
    valueBooleanField,
    valueIntegerField,
    valueRangeField,
    valueRatioField,
    valueSampledDataField,
    valueTimeField,
    valueDateTimeField,
    valuePeriodField,
    dataAbsentReasonField,
    interpretationField,
    noteField,
    bodySiteField,
    methodField,
    specimenField,
    deviceField,
    referenceRangeField,
    hasMemberField,
    derivedFromField,
    componentField,
    complicatedByField,
    contextOfUseField,
  ];

  static Definable<FixedList<Identifier>> _getIdentifier(JsonObject jo) =>
      jo.getValueFromObjectArray(
        identifierField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Reference>> _getBasedOn(JsonObject jo) =>
      jo.getValueFromObjectArray(
        basedOnField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Reference>> _getPartOf(JsonObject jo) =>
      jo.getValueFromObjectArray(
        partOfField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<String> _getStatus(JsonObject jo) =>
      jo.getValue(statusField.name);

  static Definable<FixedList<CodeableConcept>> _getCategory(JsonObject jo) =>
      jo.getValueFromObjectArray(
        categoryField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<CodeableConcept> _getCode(JsonObject jo) =>
      jo.getValueFromObjectArray(
        codeField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Reference> _getSubject(JsonObject jo) =>
      jo.getValueFromObjectArray(
        subjectField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Reference> _getEncounter(JsonObject jo) =>
      jo.getValueFromObjectArray(
        encounterField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<DateTime> _getEffectiveDateTime(JsonObject jo) =>
      jo.getValueFromString(
        effectiveDateTimeField.name,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  static Definable<Period> _getEffectivePeriod(JsonObject jo) =>
      jo.getValueFromObjectArray(
        effectivePeriodField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Period.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Timing> _getEffectiveTiming(JsonObject jo) =>
      jo.getValueFromObjectArray(
        effectiveTimingField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Timing.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<DateTime> _getEffectiveInstant(JsonObject jo) =>
      jo.getValueFromString(
        effectiveInstantField.name,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  static Definable<DateTime> _getIssued(JsonObject jo) => jo.getValueFromString(
        issuedField.name,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  static Definable<Quantity> _getValueQuantity(JsonObject jo) =>
      jo.getValueFromObjectArray(
        valueQuantityField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Quantity.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<CodeableConcept> _getValueCodeableConcept(JsonObject jo) =>
      jo.getValueFromObjectArray(
        valueCodeableConceptField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<String> _getValueString(JsonObject jo) =>
      jo.getValue(valueStringField.name);

  static Definable<bool> _getValueBoolean(JsonObject jo) =>
      jo.getValue(valueBooleanField.name);

  static Definable<int> _getValueInteger(JsonObject jo) =>
      jo.getValue(valueIntegerField.name);

  static Definable<Range> _getValueRange(JsonObject jo) =>
      jo.getValueFromObjectArray(
        valueRangeField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Range.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Ratio> _getValueRatio(JsonObject jo) =>
      jo.getValueFromObjectArray(
        valueRatioField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Ratio.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<SampledData> _getValueSampledData(JsonObject jo) =>
      jo.getValueFromObjectArray(
        valueSampledDataField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => SampledData.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Time> _getValueTime(JsonObject jo) => jo.getValueFromString(
        valueTimeField.name,
        tryParse: (t) => Time.tryParse(t ?? ''),
      );

  static Definable<DateTime> _getValueDateTime(JsonObject jo) =>
      jo.getValueFromString(
        valueDateTimeField.name,
        tryParse: (d) => DateTime.tryParse(d ?? ''),
      );

  static Definable<Period> _getValuePeriod(JsonObject jo) =>
      jo.getValueFromObjectArray(
        valuePeriodField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Period.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<CodeableConcept> _getDataAbsentReason(JsonObject jo) =>
      jo.getValueFromObjectArray(
        dataAbsentReasonField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<FixedList<CodeableConcept>> _getInterpretation(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        interpretationField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Annotation>> _getNote(JsonObject jo) =>
      jo.getValueFromObjectArray(
        noteField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Annotation.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<CodeableConcept> _getBodySite(JsonObject jo) =>
      jo.getValueFromObjectArray(
        bodySiteField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<CodeableConcept> _getMethod(JsonObject jo) =>
      jo.getValueFromObjectArray(
        methodField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Reference> _getSpecimen(JsonObject jo) =>
      jo.getValueFromObjectArray(
        specimenField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Reference> _getDevice(JsonObject jo) =>
      jo.getValueFromObjectArray(
        deviceField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<FixedList<ObservationReferenceRange>> _getReferenceRange(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        referenceRangeField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map(
              (dm) => ObservationReferenceRange.fromJson(
                dm as Map<String, dynamic>,
              ),
            )
            .toFixedList(),
      );

  static Definable<FixedList<Reference>> _getHasMember(JsonObject jo) =>
      jo.getValueFromObjectArray(
        hasMemberField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Reference>> _getDerivedFrom(JsonObject jo) =>
      jo.getValueFromObjectArray(
        derivedFromField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<ObservationComponent>> _getComponent(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        componentField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map(
              (dm) => ObservationComponent.fromJson(dm as Map<String, dynamic>),
            )
            .toFixedList(),
      );

  static Definable<FixedList<CodeableReference>> _getComplicatedBy(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        complicatedByField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map(
              (dm) => CodeableReference.fromJson(dm as Map<String, dynamic>),
            )
            .toFixedList(),
      );

  static Definable<FixedList<CodeableReference>> _getContextOfUse(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        contextOfUseField.name,
        fromObjectArray: (jsonTags) => jsonTags
            ?.map(
              (dm) => CodeableReference.fromJson(dm as Map<String, dynamic>),
            )
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

/// A collection of error, warning, or information messages that result from a system action.
class OperationOutcome<T> extends Resource implements Result<T> {
  /// Constructs a new [OperationOutcome].
  OperationOutcome({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<Text> text = const Undefined(),
    Definable<FixedList<Issue>> issue = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (text is Defined<Text>) text.toMapEntry(),
            if (issue is Defined<FixedList<Issue>>) issue.toMapEntry(),
          ]),
        );

  /// Creates an [OperationOutcome] instance from the provided JSON object.
  OperationOutcome.fromJson(super.json) : super._internal();

  /// A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human.
  Definable<Text> get text => textField.getValue(this);

  /// A single issue associated with the action.
  Definable<FixedList<Issue>> get issue => issueField.getValue(this);

  /// Field definition for [text].
  static const textField = FieldDefinition(
    name: 'text',
    getValue: _getText,
  );

  /// Field definition for [issue].
  static const issueField = FieldDefinition(
    name: 'issue',
    getValue: _getIssue,
  );

  /// All field definitions for [OperationOutcome].
  static const fieldDefinitions = [
    ...Resource.fieldDefinitions,
    textField,
    issueField,
  ];

  static Definable<Text> _getText(JsonObject jo) => jo.getValueFromObjectArray(
        'text',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Text.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<FixedList<Issue>> _getIssue(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'issue',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Issue.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperationOutcome &&
          other.id == id &&
          other.meta == meta &&
          other.text == text &&
          other.issue == issue);

  @override
  int get hashCode => Object.hash(id, meta, text, issue);

  /// Creates a copy of the [OperationOutcome] instance and allows for non-destructive mutation.
  OperationOutcome<T> copyWith({
    Definable<String>? id,
    Definable<Meta>? meta,
    Definable<Text>? text,
    Definable<FixedList<Issue>>? issue,
  }) =>
      OperationOutcome<T>(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        text: text ?? this.text,
        issue: issue ?? this.issue,
      );
}

class Organization extends Resource {
  /// Constructs a new [Organization].
  Organization({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<FixedList<Identifier>> identifier = const Undefined(),
    Definable<FixedList<t.Type>> type = const Undefined(),
    Definable<String> name = const Undefined(),
    Definable<int> total = const Undefined(),
    Definable<FixedList<Link>> link = const Undefined(),
    Definable<FixedList<Entry>> entry = const Undefined(),
    Definable<bool> active = const Undefined(),
    Definable<FixedList<Telecom>> telecom = const Undefined(),
    Definable<FixedList<Address>> address = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (identifier is Defined<FixedList<Identifier>>)
              identifier.toMapEntry(),
            if (type is Defined<FixedList<t.Type>>) type.toMapEntry(),
            if (name is Defined<String>) name.toMapEntry(),
            if (total is Defined<int>) total.toMapEntry(),
            if (link is Defined<FixedList<Link>>) link.toMapEntry(),
            if (entry is Defined<FixedList<Entry>>) entry.toMapEntry(),
            if (active is Defined<bool>) active.toMapEntry(),
            if (telecom is Defined<FixedList<Telecom>>) telecom.toMapEntry(),
            if (address is Defined<FixedList<Address>>) address.toMapEntry(),
          ]),
        );

  /// Creates an [Organization] instance from the provided JSON object.
  Organization.fromJson(super.json) : super._internal();

  /// Identifier for the organization that is used to identify the organization across multiple disparate systems.
  Definable<FixedList<Identifier>> get identifier =>
      identifierField.getValue(this);

  /// The kind(s) of organization that this is.
  Definable<FixedList<t.Type>> get type => typeField.getValue(this);

  /// A name associated with the organization.
  Definable<String> get name => nameField.getValue(this);

  /// The total number of entries.
  Definable<int> get total => totalField.getValue(this);

  /// A reference to a link.
  Definable<FixedList<Link>> get link => linkField.getValue(this);

  /// An entry in the organization.
  Definable<FixedList<Entry>> get entry => entryField.getValue(this);

  /// Whether the organization's record is still in active use.
  Definable<bool> get active => activeField.getValue(this);

  /// A contact detail for the organization.
  Definable<FixedList<Telecom>> get telecom => telecomField.getValue(this);

  /// An address for the organization.
  Definable<FixedList<Address>> get address => addressField.getValue(this);

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [type].
  static const typeField = FieldDefinition(
    name: 'type',
    getValue: _getType,
  );

  /// Field definition for [name].
  static final nameField = FieldDefinition(
    name: 'name',
    getValue: (jo) => jo.getValue<String>('name'),
  );

  /// Field definition for [total].
  static final totalField = FieldDefinition(
    name: 'total',
    getValue: (jo) => jo.getValue<int>('total'),
  );

  /// Field definition for [link].
  static const linkField = FieldDefinition(
    name: 'link',
    getValue: _getLink,
  );

  /// Field definition for [entry].
  static const entryField = FieldDefinition(
    name: 'entry',
    getValue: _getEntry,
  );

  /// Field definition for [active].
  static final activeField = FieldDefinition(
    name: 'active',
    getValue: (jo) => jo.getValue<bool>('active'),
  );

  /// Field definition for [telecom].
  static const telecomField = FieldDefinition(
    name: 'telecom',
    getValue: _getTelecom,
  );

  /// Field definition for [address].
  static const addressField = FieldDefinition(
    name: 'address',
    getValue: _getAddress,
  );

  //Note: not all const...

  /// All field definitions for [Organization].
  static final fieldDefinitions = [
    ...Resource.fieldDefinitions,
    identifierField,
    typeField,
    nameField,
    totalField,
    linkField,
    entryField,
    activeField,
    telecomField,
    addressField,
  ];

  static Definable<FixedList<Identifier>> _getIdentifier(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'identifier',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<t.Type>> _getType(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'type',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => t.Type.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Link>> _getLink(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'link',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Link.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Entry>> _getEntry(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'entry',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Entry.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Telecom>> _getTelecom(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'telecom',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Telecom.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Address>> _getAddress(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'address',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Address.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Organization &&
          other.id == id &&
          other.meta == meta &&
          other.identifier == identifier &&
          other.type == type &&
          other.name == name &&
          other.total == total &&
          other.link == link &&
          other.entry == entry &&
          other.active == active &&
          other.telecom == telecom &&
          other.address == address);

  @override
  int get hashCode => Object.hash(
        id,
        meta,
        identifier,
        type,
        name,
        total,
        link,
        entry,
        active,
        telecom,
        address,
      );

  /// Creates a copy of the [Organization] instance and allows for non-destructive mutation.
  Organization copyWith({
    Definable<String>? id,
    Definable<Meta>? meta,
    Definable<FixedList<Identifier>>? identifier,
    Definable<FixedList<t.Type>>? type,
    Definable<String>? name,
    Definable<int>? total,
    Definable<FixedList<Link>>? link,
    Definable<FixedList<Entry>>? entry,
    Definable<bool>? active,
    Definable<FixedList<Telecom>>? telecom,
    Definable<FixedList<Address>>? address,
  }) =>
      Organization(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        type: type ?? this.type,
        name: name ?? this.name,
        total: total ?? this.total,
        link: link ?? this.link,
        entry: entry ?? this.entry,
        active: active ?? this.active,
        telecom: telecom ?? this.telecom,
        address: address ?? this.address,
      );
}

/// Demographics and other administrative information about an individual or animal receiving care or other health-related services.
class Patient extends Resource {
  /// Constructs a new [Patient].
  Patient({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<FixedList<Identifier>> identifier = const Undefined(),
    Definable<bool> active = const Undefined(),
    Definable<FixedList<Name>> name = const Undefined(),
    Definable<FixedList<Telecom>> telecom = const Undefined(),
    Definable<AdministrativeGender> gender = const Undefined(),
    Definable<DateTime> birthDate = const Undefined(),
    Definable<FixedList<Address>> address = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (identifier is Defined<FixedList<Identifier>>)
              identifier.toMapEntry(),
            if (active is Defined<bool>) active.toMapEntry(),
            if (name is Defined<FixedList<Name>>) name.toMapEntry(),
            if (telecom is Defined<FixedList<Telecom>>) telecom.toMapEntry(),
            if (gender is Defined<AdministrativeGender>) gender.toMapEntry(),
            if (birthDate is Defined<DateTime>) birthDate.toMapEntry(),
            if (address is Defined<FixedList<Address>>) address.toMapEntry(),
          ]),
        );

  /// Creates a [Patient] instance from the provided JSON object.
  Patient.fromJson(super.json) : super._internal();

  /// An identifier for this patient.
  Definable<FixedList<Identifier>> get identifier =>
      identifierField.getValue(this);

  /// Whether this patient record is in active use.
  Definable<bool> get active => activeField.getValue(this);

  /// A name associated with the patient.
  Definable<FixedList<Name>> get name => nameField.getValue(this);

  /// A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.
  Definable<FixedList<Telecom>> get telecom => telecomField.getValue(this);

  /// Administrative Gender - the gender that the patient is considered to have for administration and record keeping purposes.
  Definable<AdministrativeGender> get gender => genderField.getValue(this);

  /// The date of birth for the individual.
  Definable<DateTime> get birthDate => birthDateField.getValue(this);

  /// An address for the individual.
  Definable<FixedList<Address>> get address => addressField.getValue(this);

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [active].
  static final activeField = FieldDefinition(
    name: 'active',
    getValue: (jo) => jo.getValue<bool>('active'),
  );

  /// Field definition for [name].
  static const nameField = FieldDefinition(
    name: 'name',
    getValue: _getName,
  );

  /// Field definition for [telecom].
  static const telecomField = FieldDefinition(
    name: 'telecom',
    getValue: _getTelecom,
  );

  /// Field definition for [gender].
  static const genderField = FieldDefinition(
    name: 'gender',
    getValue: _getGender,
  );

  /// Field definition for [birthDate].
  static const birthDateField = FieldDefinition(
    name: 'birthDate',
    getValue: _getBirthDate,
  );

  /// Field definition for [address].
  static const addressField = FieldDefinition(
    name: 'address',
    getValue: _getAddress,
  );

  /// All field definitions for [Patient].
  static final fieldDefinitions = [
    ...Resource.fieldDefinitions,
    identifierField,
    activeField,
    nameField,
    telecomField,
    genderField,
    birthDateField,
    addressField,
  ];

  static Definable<FixedList<Identifier>> _getIdentifier(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'identifier',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Name>> _getName(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'name',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Name.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Telecom>> _getTelecom(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'telecom',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Telecom.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<AdministrativeGender> _getGender(JsonObject jo) =>
      jo.getValueFromString(
        'gender',
        tryParse: (value) =>
            value != null ? AdministrativeGender.fromCode(value) : null,
      );

  static Definable<DateTime> _getBirthDate(JsonObject jo) =>
      jo.getValueFromString(
        'birthDate',
        tryParse: (value) => value != null ? DateTime.parse(value) : null,
      );

  static Definable<FixedList<Address>> _getAddress(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'address',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Address.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == id &&
          other.meta == meta &&
          other.identifier == identifier &&
          other.active == active &&
          other.name == name &&
          other.telecom == telecom &&
          other.gender == gender &&
          other.birthDate == birthDate &&
          other.address == address);

  @override
  int get hashCode => Object.hash(
        id,
        meta,
        identifier,
        active,
        name,
        telecom,
        gender,
        birthDate,
        address,
      );

  /// Creates a copy of the [Patient] instance and allows for non-destructive mutation.
  Patient copyWith({
    Definable<String>? id,
    Definable<Meta>? meta,
    Definable<FixedList<Identifier>>? identifier,
    Definable<bool>? active,
    Definable<FixedList<Name>>? name,
    Definable<FixedList<Telecom>>? telecom,
    Definable<AdministrativeGender>? gender,
    Definable<DateTime>? birthDate,
    Definable<FixedList<Address>>? address,
  }) =>
      Patient(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        active: active ?? this.active,
        name: name ?? this.name,
        telecom: telecom ?? this.telecom,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        address: address ?? this.address,
      );
}

/// A person who is directly or indirectly involved in the provisioning of healthcare.
class Practitioner extends Resource {
  /// Constructs a new [Practitioner].
  Practitioner({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<FixedList<Identifier>> identifier = const Undefined(),
    Definable<FixedList<t.Type>> type = const Undefined(),
    Definable<FixedList<Name>> name = const Undefined(),
    Definable<int> total = const Undefined(),
    Definable<FixedList<Link>> link = const Undefined(),
    Definable<FixedList<Entry>> entry = const Undefined(),
    Definable<bool> active = const Undefined(),
    Definable<FixedList<Telecom>> telecom = const Undefined(),
    Definable<FixedList<Address>> address = const Undefined(),
    Definable<AdministrativeGender> gender = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (identifier is Defined<FixedList<Identifier>>)
              identifier.toMapEntry(),
            if (type is Defined<FixedList<t.Type>>) type.toMapEntry(),
            if (name is Defined<FixedList<Name>>) name.toMapEntry(),
            if (total is Defined<int>) total.toMapEntry(),
            if (link is Defined<FixedList<Link>>) link.toMapEntry(),
            if (entry is Defined<FixedList<Entry>>) entry.toMapEntry(),
            if (active is Defined<bool>) active.toMapEntry(),
            if (telecom is Defined<FixedList<Telecom>>) telecom.toMapEntry(),
            if (address is Defined<FixedList<Address>>) address.toMapEntry(),
            if (gender is Defined<AdministrativeGender>) gender.toMapEntry(),
          ]),
        );

  /// Creates a [Practitioner] instance from the provided JSON object.
  Practitioner.fromJson(super.json) : super._internal();

  /// An identifier that applies to this person in this role.
  Definable<FixedList<Identifier>> get identifier =>
      identifierField.getValue(this);

  /// The kind(s) of roles the practitioner plays.
  Definable<FixedList<t.Type>> get type => typeField.getValue(this);

  /// The name(s) associated with the practitioner.
  Definable<FixedList<Name>> get name => nameField.getValue(this);

  /// The total number of entries.
  Definable<int> get total => totalField.getValue(this);

  /// A reference to a link.
  Definable<FixedList<Link>> get link => linkField.getValue(this);

  /// An entry in the practitioner's record.
  Definable<FixedList<Entry>> get entry => entryField.getValue(this);

  /// Whether this practitioner's record is in active use.
  Definable<bool> get active => activeField.getValue(this);

  /// A contact detail for the practitioner, e.g. a telephone number or an email address.
  Definable<FixedList<Telecom>> get telecom => telecomField.getValue(this);

  /// Address(es) of the practitioner that are not role specific (typically home address).
  Definable<FixedList<Address>> get address => addressField.getValue(this);

  /// Administrative Gender - the gender that the practitioner is considered to have for administration and record keeping purposes.
  Definable<AdministrativeGender> get gender => genderField.getValue(this);

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [type].
  static const typeField = FieldDefinition(
    name: 'type',
    getValue: _getType,
  );

  /// Field definition for [name].
  static const nameField = FieldDefinition(
    name: 'name',
    getValue: _getName,
  );

  /// Field definition for [total].
  static final totalField = FieldDefinition(
    name: 'total',
    getValue: (jo) => jo.getValue<int>('total'),
  );

  /// Field definition for [link].
  static const linkField = FieldDefinition(
    name: 'link',
    getValue: _getLink,
  );

  /// Field definition for [entry].
  static const entryField = FieldDefinition(
    name: 'entry',
    getValue: _getEntry,
  );

  /// Field definition for [active].
  static final activeField = FieldDefinition(
    name: 'active',
    getValue: (jo) => jo.getValue<bool>('active'),
  );

  /// Field definition for [telecom].
  static const telecomField = FieldDefinition(
    name: 'telecom',
    getValue: _getTelecom,
  );

  /// Field definition for [address].
  static const addressField = FieldDefinition(
    name: 'address',
    getValue: _getAddress,
  );

  /// Field definition for [gender].
  static const genderField = FieldDefinition(
    name: 'gender',
    getValue: _getGender,
  );

  /// All field definitions for [Practitioner].
  static final fieldDefinitions = [
    ...Resource.fieldDefinitions,
    identifierField,
    typeField,
    nameField,
    totalField,
    linkField,
    entryField,
    activeField,
    telecomField,
    addressField,
    genderField,
  ];

  static Definable<FixedList<Identifier>> _getIdentifier(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'identifier',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<t.Type>> _getType(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'type',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => t.Type.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Name>> _getName(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'name',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Name.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Link>> _getLink(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'link',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Link.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Entry>> _getEntry(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'entry',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Entry.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Telecom>> _getTelecom(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'telecom',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Telecom.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Address>> _getAddress(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'address',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Address.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<AdministrativeGender> _getGender(JsonObject jo) =>
      jo.getValueFromString(
        'gender',
        tryParse: (value) => value != null
            ? AdministrativeGender.fromCode(value)
            : AdministrativeGender.unknown,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Practitioner &&
          other.id == id &&
          other.meta == meta &&
          other.identifier == identifier &&
          other.type == type &&
          other.name == name &&
          other.total == total &&
          other.link == link &&
          other.entry == entry &&
          other.active == active &&
          other.telecom == telecom &&
          other.address == address &&
          other.gender == gender);

  @override
  int get hashCode => Object.hash(
        id,
        meta,
        identifier,
        type,
        name,
        total,
        link,
        entry,
        active,
        telecom,
        address,
        gender,
      );

  /// Creates a copy of the [Practitioner] instance and allows for non-destructive mutation.
  Practitioner copyWith({
    Definable<String>? id,
    Definable<Meta>? meta,
    Definable<FixedList<Identifier>>? identifier,
    Definable<FixedList<t.Type>>? type,
    Definable<FixedList<Name>>? name,
    Definable<int>? total,
    Definable<FixedList<Link>>? link,
    Definable<FixedList<Entry>>? entry,
    Definable<bool>? active,
    Definable<FixedList<Telecom>>? telecom,
    Definable<FixedList<Address>>? address,
    Definable<AdministrativeGender>? gender,
  }) =>
      Practitioner(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        type: type ?? this.type,
        name: name ?? this.name,
        total: total ?? this.total,
        link: link ?? this.link,
        entry: entry ?? this.entry,
        active: active ?? this.active,
        telecom: telecom ?? this.telecom,
        address: address ?? this.address,
        gender: gender ?? this.gender,
      );
}

class PractitionerRole extends Resource {
  /// Constructs a new [PractitionerRole].
  ///
  /// A specific set of Roles/Locations/specialties/services that a practitioner may perform at an organization for a period of time.
  PractitionerRole({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<FixedList<Extension>> extension = const Undefined(),
    Definable<FixedList<Identifier>> identifier = const Undefined(),
    Definable<bool> active = const Undefined(),
    Definable<String> name = const Undefined(),
    Definable<Period> period = const Undefined(),
    Definable<Reference> practitioner = const Undefined(),
    Definable<FixedList<CodeableConcept>> code = const Undefined(),
    Definable<FixedList<CodeableConcept>> specialty = const Undefined(),
    Definable<FixedList<Location>> location = const Undefined(),
    Definable<FixedList<AvailableTime>> availableTime = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (extension is Defined<FixedList<Extension>>)
              extension.toMapEntry(),
            if (identifier is Defined<FixedList<Identifier>>)
              identifier.toMapEntry(),
            if (active is Defined<bool>) active.toMapEntry(),
            if (name is Defined<String>) name.toMapEntry(),
            if (period is Defined<Period>) period.toMapEntry(),
            if (practitioner is Defined<Reference>) practitioner.toMapEntry(),
            if (code is Defined<FixedList<CodeableConcept>>) code.toMapEntry(),
            if (specialty is Defined<FixedList<CodeableConcept>>)
              specialty.toMapEntry(),
            if (location is Defined<FixedList<Location>>) location.toMapEntry(),
            if (availableTime is Defined<FixedList<AvailableTime>>)
              availableTime.toMapEntry(),
          ]),
        );

  /// Creates a [PractitionerRole] instance from the provided JSON object.
  PractitionerRole.fromJson(super.json) : super._internal();

  /// May be used to represent additional information that is not part of the basic definition of the resource. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions.
  Definable<FixedList<Extension>> get extension =>
      extensionField.getValue(this);

  /// Business Identifiers that are specific to a role/location.
  Definable<FixedList<Identifier>> get identifier =>
      identifierField.getValue(this);

  /// Whether this practitioner role record is in active use.
  Definable<bool> get active => activeField.getValue(this);

  /// A name associated with the role.
  Definable<String> get name => nameField.getValue(this);

  /// The period during which the practitioner is authorized to perform in these role(s).
  Definable<Period> get period => periodField.getValue(this);

  /// Practitioner that is able to provide the defined services for the organization.
  Definable<Reference> get practitioner => practitionerField.getValue(this);

  /// Roles which this practitioner is authorized to perform for the organization.
  Definable<FixedList<CodeableConcept>> get code => codeField.getValue(this);

  /// Specific specialty of the practitioner.
  Definable<FixedList<CodeableConcept>> get specialty =>
      specialtyField.getValue(this);

  /// The location(s) at which this practitioner provides care.
  Definable<FixedList<Location>> get location => locationField.getValue(this);

  /// A collection of times the practitioner is available or performing this role at the location and/or healthcareservice.
  Definable<FixedList<AvailableTime>> get availableTime =>
      availableTimeField.getValue(this);

  /// Field definition for [extension].
  static const extensionField = FieldDefinition(
    name: 'extension',
    getValue: _getExtension,
  );

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [active].
  static final activeField = FieldDefinition(
    name: 'active',
    getValue: (jo) => jo.getValue<bool>('active'),
  );

  /// Field definition for [name].
  static final nameField = FieldDefinition(
    name: 'name',
    getValue: (jo) => jo.getValue<String>('name'),
  );

  /// Field definition for [period].
  static const periodField = FieldDefinition(
    name: 'period',
    getValue: _getPeriod,
  );

  /// Field definition for [practitioner].
  static const practitionerField = FieldDefinition(
    name: 'practitioner',
    getValue: _getPractitioner,
  );

  /// Field definition for [code].
  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  /// Field definition for [specialty].
  static const specialtyField = FieldDefinition(
    name: 'specialty',
    getValue: _getSpecialty,
  );

  /// Field definition for [location].
  static const locationField = FieldDefinition(
    name: 'location',
    getValue: _getLocation,
  );

  /// Field definition for [availableTime].
  static const availableTimeField = FieldDefinition(
    name: 'availableTime',
    getValue: _getAvailableTime,
  );

  /// All field definitions for [PractitionerRole].
  static final fieldDefinitions = [
    ...Resource.fieldDefinitions,
    extensionField,
    identifierField,
    activeField,
    nameField,
    periodField,
    practitionerField,
    codeField,
    specialtyField,
    locationField,
    availableTimeField,
  ];

  static Definable<FixedList<Extension>> _getExtension(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'extension',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Extension.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Identifier>> _getIdentifier(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'identifier',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<Period> _getPeriod(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'period',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Period.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<Reference> _getPractitioner(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'practitioner',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Reference.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<FixedList<CodeableConcept>> _getCode(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'code',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<CodeableConcept>> _getSpecialty(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'specialty',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Location>> _getLocation(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'location',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Location.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<AvailableTime>> _getAvailableTime(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'availableTime',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => AvailableTime.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PractitionerRole &&
          other.id == id &&
          other.meta == meta &&
          other.extension == extension &&
          other.identifier == identifier &&
          other.active == active &&
          other.name == name &&
          other.period == period &&
          other.practitioner == practitioner &&
          other.code == code &&
          other.specialty == specialty &&
          other.location == location &&
          other.availableTime == availableTime);

  @override
  int get hashCode => Object.hash(
        id,
        meta,
        extension,
        identifier,
        active,
        name,
        period,
        practitioner,
        code,
        specialty,
        location,
        availableTime,
      );

  /// Creates a copy of the [PractitionerRole] instance and allows for non-destructive mutation.
  PractitionerRole copyWith({
    Definable<String>? id,
    Definable<Meta>? meta,
    Definable<FixedList<Extension>>? extension,
    Definable<FixedList<Identifier>>? identifier,
    Definable<bool>? active,
    Definable<String>? name,
    Definable<Period>? period,
    Definable<Reference>? practitioner,
    Definable<FixedList<CodeableConcept>>? code,
    Definable<FixedList<CodeableConcept>>? specialty,
    Definable<FixedList<Location>>? location,
    Definable<FixedList<AvailableTime>>? availableTime,
  }) =>
      PractitionerRole(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        extension: extension ?? this.extension,
        identifier: identifier ?? this.identifier,
        active: active ?? this.active,
        name: name ?? this.name,
        period: period ?? this.period,
        practitioner: practitioner ?? this.practitioner,
        code: code ?? this.code,
        specialty: specialty ?? this.specialty,
        location: location ?? this.location,
        availableTime: availableTime ?? this.availableTime,
      );
}

class Slot extends Resource {
  /// Constructs a new [Slot].
  ///
  /// A slot of time on a schedule that may be available for booking appointments.
  Slot({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<FixedList<Identifier>> identifier = const Undefined(),
    Definable<FixedList<CodeableConcept>> serviceCategory = const Undefined(),
    Definable<FixedList<CodeableReference>> serviceType = const Undefined(),
    Definable<FixedList<CodeableConcept>> specialty = const Undefined(),
    Definable<CodeableConcept> appointmentType = const Undefined(),
    Definable<String> status = const Undefined(),
    Definable<DateTime> start = const Undefined(),
    Definable<DateTime> end = const Undefined(),
    Definable<String> comment = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (identifier is Defined<FixedList<Identifier>>)
              identifier.toMapEntry(),
            if (serviceCategory is Defined<FixedList<CodeableConcept>>)
              serviceCategory.toMapEntry(),
            if (serviceType is Defined<FixedList<CodeableReference>>)
              serviceType.toMapEntry(),
            if (specialty is Defined<FixedList<CodeableConcept>>)
              specialty.toMapEntry(),
            if (appointmentType is Defined<CodeableConcept>)
              appointmentType.toMapEntry(),
            if (status is Defined<String>) status.toMapEntry(),
            if (start is Defined<DateTime>) start.toMapEntry(),
            if (end is Defined<DateTime>) end.toMapEntry(),
            if (comment is Defined<String>) comment.toMapEntry(),
          ]),
        );

  /// Creates a [Slot] instance from the provided JSON object.
  Slot.fromJson(super.json) : super._internal();

  /// External Ids for this item.
  Definable<FixedList<Identifier>> get identifier =>
      identifierField.getValue(this);

  /// A broad categorization of the service that is to be performed during this appointment.
  Definable<FixedList<CodeableConcept>> get serviceCategory =>
      serviceCategoryField.getValue(this);

  /// The type of appointments that can be booked into this slot (ideally this would be an identifiable service - which is at a location, rather than the location itself). If provided then this overrides the value provided on the availability resource.
  Definable<FixedList<CodeableReference>> get serviceType =>
      serviceTypeField.getValue(this);

  /// The specialty of a practitioner that would be required to perform the service requested in this appointment.
  Definable<FixedList<CodeableConcept>> get specialty =>
      specialtyField.getValue(this);

  /// The style of appointment or patient that may be booked in the slot (not service type).
  Definable<CodeableConcept> get appointmentType =>
      appointmentTypeField.getValue(this);

  /// The status of the slot.
  Definable<String> get status => statusField.getValue(this);

  /// Date/Time that the slot is to begin.
  Definable<DateTime> get start => startField.getValue(this);

  /// Date/Time that the slot is to conclude.
  Definable<DateTime> get end => endField.getValue(this);

  /// Comments on the slot to describe any extended information. Such as custom constraints on the slot.
  Definable<String> get comment => commentField.getValue(this);

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [serviceCategory].
  static const serviceCategoryField = FieldDefinition(
    name: 'serviceCategory',
    getValue: _getServiceCategory,
  );

  /// Field definition for [serviceType].
  static const serviceTypeField = FieldDefinition(
    name: 'serviceType',
    getValue: _getServiceType,
  );

  /// Field definition for [specialty].
  static const specialtyField = FieldDefinition(
    name: 'specialty',
    getValue: _getSpecialty,
  );

  /// Field definition for [appointmentType].
  static const appointmentTypeField = FieldDefinition(
    name: 'appointmentType',
    getValue: _getAppointmentType,
  );

  /// Field definition for [status].
  static final statusField = FieldDefinition(
    name: 'status',
    getValue: (jo) => jo.getValue<String>('status'),
  );

  /// Field definition for [start].
  static const startField = FieldDefinition(
    name: 'start',
    getValue: _getStart,
  );

  /// Field definition for [end].
  static const endField = FieldDefinition(
    name: 'end',
    getValue: _getEnd,
  );

  /// Field definition for [comment].
  static final commentField = FieldDefinition(
    name: 'comment',
    getValue: (jo) => jo.getValue<String>('comment'),
  );

  /// All field definitions for [Slot].
  static final fieldDefinitions = [
    ...Resource.fieldDefinitions,
    identifierField,
    serviceCategoryField,
    serviceTypeField,
    specialtyField,
    appointmentTypeField,
    statusField,
    startField,
    endField,
    commentField,
  ];

  static Definable<FixedList<Identifier>> _getIdentifier(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'identifier',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<CodeableConcept>> _getServiceCategory(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        'serviceCategory',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<CodeableReference>> _getServiceType(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        'serviceType',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map(
              (dm) => CodeableReference.fromJson(dm as Map<String, dynamic>),
            )
            .toFixedList(),
      );

  static Definable<FixedList<CodeableConcept>> _getSpecialty(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'specialty',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<CodeableConcept> _getAppointmentType(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'appointmentType',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  static Definable<DateTime> _getStart(JsonObject jo) => jo.getValueFromString(
        'start',
        tryParse: (value) => value != null ? DateTime.tryParse(value) : null,
      );

  static Definable<DateTime> _getEnd(JsonObject jo) => jo.getValueFromString(
        'end',
        tryParse: (value) => value != null ? DateTime.tryParse(value) : null,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Slot &&
          other.id == id &&
          other.meta == meta &&
          other.identifier == identifier &&
          other.serviceCategory == serviceCategory &&
          other.serviceType == serviceType &&
          other.specialty == specialty &&
          other.appointmentType == appointmentType &&
          other.status == status &&
          other.start == start &&
          other.end == end &&
          other.comment == comment);

  @override
  int get hashCode => Object.hash(
        id,
        meta,
        identifier,
        serviceCategory,
        serviceType,
        specialty,
        appointmentType,
        status,
        start,
        end,
        comment,
      );

  /// Creates a copy of the [Slot] instance and allows for non-destructive mutation.
  Slot copyWith({
    Definable<String>? id,
    Definable<Meta>? meta,
    Definable<FixedList<Identifier>>? identifier,
    Definable<FixedList<CodeableConcept>>? serviceCategory,
    Definable<FixedList<CodeableReference>>? serviceType,
    Definable<FixedList<CodeableConcept>>? specialty,
    Definable<CodeableConcept>? appointmentType,
    Definable<String>? status,
    Definable<DateTime>? start,
    Definable<DateTime>? end,
    Definable<String>? comment,
  }) =>
      Slot(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        serviceCategory: serviceCategory ?? this.serviceCategory,
        serviceType: serviceType ?? this.serviceType,
        specialty: specialty ?? this.specialty,
        appointmentType: appointmentType ?? this.appointmentType,
        status: status ?? this.status,
        start: start ?? this.start,
        end: end ?? this.end,
        comment: comment ?? this.comment,
      );
}

class Schedule extends Resource {
  /// Constructs a new [Schedule].
  ///
  /// A schedule of appointments.
  Schedule({
    Definable<String> id = const Undefined(),
    Definable<Meta> meta = const Undefined(),
    Definable<FixedList<Identifier>> identifier = const Undefined(),
    Definable<FixedList<CodeableReference>> serviceType = const Undefined(),
    Definable<FixedList<CodeableConcept>> serviceCategory = const Undefined(),
    Definable<FixedList<CodeableConcept>> specialty = const Undefined(),
    Definable<FixedList<Actor>> actor = const Undefined(),
    Definable<PlanningHorizon> planningHorizon = const Undefined(),
    Definable<String> comment = const Undefined(),
    Definable<bool> active = const Undefined(),
  }) : super._internal(
          Map<String, dynamic>.fromEntries([
            if (id is Defined<String>) id.toMapEntry(),
            if (meta is Defined<Meta>) meta.toMapEntry(),
            if (identifier is Defined<FixedList<Identifier>>)
              identifier.toMapEntry(),
            if (serviceType is Defined<FixedList<CodeableReference>>)
              serviceType.toMapEntry(),
            if (serviceCategory is Defined<FixedList<CodeableConcept>>)
              serviceCategory.toMapEntry(),
            if (specialty is Defined<FixedList<CodeableConcept>>)
              specialty.toMapEntry(),
            if (actor is Defined<FixedList<Actor>>) actor.toMapEntry(),
            if (planningHorizon is Defined<PlanningHorizon>)
              planningHorizon.toMapEntry(),
            if (comment is Defined<String>) comment.toMapEntry(),
            if (active is Defined<bool>) active.toMapEntry(),
          ]),
        );

  /// Creates a [Schedule] instance from the provided JSON object.
  Schedule.fromJson(super.json) : super._internal();

  /// External Ids for this item.
  Definable<FixedList<Identifier>> get identifier =>
      identifierField.getValue(this);

  /// The type of appointments that can be booked into this schedule (ideally this would be an identifiable service - which is at a location, rather than the location itself).
  Definable<FixedList<CodeableReference>> get serviceType =>
      serviceTypeField.getValue(this);

  /// A broad categorization of the service that is to be performed during this schedule.
  Definable<FixedList<CodeableConcept>> get serviceCategory =>
      serviceCategoryField.getValue(this);

  /// The specialty of a practitioner that would be required to perform the services requested in this schedule.
  Definable<FixedList<CodeableConcept>> get specialty =>
      specialtyField.getValue(this);

  /// The actors that are available to perform services in this schedule.
  Definable<FixedList<Actor>> get actor => actorField.getValue(this);

  /// The period of time that the schedule refers to.
  Definable<PlanningHorizon> get planningHorizon =>
      planningHorizonField.getValue(this);

  /// Comments on the schedule to describe any extended information. Such as custom constraints on the schedule.
  Definable<String> get comment => commentField.getValue(this);

  /// Whether this schedule is currently active or not.
  Definable<bool> get active => activeField.getValue(this);

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [serviceType].
  static const serviceTypeField = FieldDefinition(
    name: 'serviceType',
    getValue: _getServiceType,
  );

  /// Field definition for [serviceCategory].
  static const serviceCategoryField = FieldDefinition(
    name: 'serviceCategory',
    getValue: _getServiceCategory,
  );

  /// Field definition for [specialty].
  static const specialtyField = FieldDefinition(
    name: 'specialty',
    getValue: _getSpecialty,
  );

  /// Field definition for [actor].
  static const actorField = FieldDefinition(
    name: 'actor',
    getValue: _getActor,
  );

  /// Field definition for [planningHorizon].
  static const planningHorizonField = FieldDefinition(
    name: 'planningHorizon',
    getValue: _getPlanningHorizon,
  );

  /// Field definition for [comment].
  static final commentField = FieldDefinition(
    name: 'comment',
    getValue: (jo) => jo.getValue<String>('comment'),
  );

  /// Field definition for [active].
  static final activeField = FieldDefinition(
    name: 'active',
    getValue: (jo) => jo.getValue<bool>('active'),
  );

  /// All field definitions for [Schedule].
  static final fieldDefinitions = [
    ...Resource.fieldDefinitions,
    identifierField,
    serviceTypeField,
    serviceCategoryField,
    specialtyField,
    actorField,
    planningHorizonField,
    commentField,
    activeField,
  ];

  static Definable<FixedList<Identifier>> _getIdentifier(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'identifier',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Identifier.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<CodeableReference>> _getServiceType(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        'serviceType',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map(
              (dm) => CodeableReference.fromJson(dm as Map<String, dynamic>),
            )
            .toFixedList(),
      );

  static Definable<FixedList<CodeableConcept>> _getServiceCategory(
    JsonObject jo,
  ) =>
      jo.getValueFromObjectArray(
        'serviceCategory',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<CodeableConcept>> _getSpecialty(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'specialty',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => CodeableConcept.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<FixedList<Actor>> _getActor(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'actor',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => Actor.fromJson(dm as Map<String, dynamic>))
            .toFixedList(),
      );

  static Definable<PlanningHorizon> _getPlanningHorizon(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'planningHorizon',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => PlanningHorizon.fromJson(dm as Map<String, dynamic>))
            .first,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == id &&
          other.meta == meta &&
          other.identifier == identifier &&
          other.serviceType == serviceType &&
          other.serviceCategory == serviceCategory &&
          other.specialty == specialty &&
          other.actor == actor &&
          other.planningHorizon == planningHorizon &&
          other.comment == comment &&
          other.active == active);

  @override
  int get hashCode => Object.hash(
        id,
        meta,
        identifier,
        serviceType,
        serviceCategory,
        specialty,
        actor,
        planningHorizon,
        comment,
        active,
      );

  /// Creates a copy of the [Schedule] instance and allows for non-destructive mutation.
  Schedule copyWith({
    Definable<String>? id,
    Definable<Meta>? meta,
    Definable<FixedList<Identifier>>? identifier,
    Definable<FixedList<CodeableReference>>? serviceType,
    Definable<FixedList<CodeableConcept>>? serviceCategory,
    Definable<FixedList<CodeableConcept>>? specialty,
    Definable<FixedList<Actor>>? actor,
    Definable<PlanningHorizon>? planningHorizon,
    Definable<String>? comment,
    Definable<bool>? active,
  }) =>
      Schedule(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        serviceType: serviceType ?? this.serviceType,
        serviceCategory: serviceCategory ?? this.serviceCategory,
        specialty: specialty ?? this.specialty,
        actor: actor ?? this.actor,
        planningHorizon: planningHorizon ?? this.planningHorizon,
        comment: comment ?? this.comment,
        active: active ?? this.active,
      );
}

// ignore_for_file: lines_longer_than_80_chars, comment_references, use_super_parameters

import 'package:fhir_client/models/actor.dart';
import 'package:fhir_client/models/address.dart';
import 'package:fhir_client/models/admit_source.dart';
import 'package:fhir_client/models/annotation.dart';
import 'package:fhir_client/models/available_time.dart';
import 'package:fhir_client/models/basic_types/field_definition.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/time.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/codeable_reference.dart';
import 'package:fhir_client/models/contact_point.dart';
import 'package:fhir_client/models/entry.dart';
import 'package:fhir_client/models/extension.dart';
import 'package:fhir_client/models/identifier.dart';
import 'package:fhir_client/models/issue.dart';
import 'package:fhir_client/models/length.dart';
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
import 'package:fhir_client/models/text.dart';
import 'package:fhir_client/models/timing.dart';
import 'package:fhir_client/models/type.dart' as t;
import 'package:fhir_client/models/value_sets/administrative_gender.dart';
import 'package:fhir_client/models/value_sets/resource_type.dart';
import 'package:jayse/jayse.dart';

/// The result of an update operation
sealed class UpdateResult<T extends Resource> {
  const UpdateResult();
}

/// The result of a successful update operation
final class UpdateSuccess<T extends Resource> extends UpdateResult<T> {
  const UpdateSuccess(this.updatedResource) : super();
  final T updatedResource;
}

/// The result of a failed update operation
final class UpdateFailure<T extends Resource> extends UpdateResult<T> {
  const UpdateFailure(this.error) : super();
  final String error;
}

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
sealed class Resource {
  Resource._internal(this.json);

  factory Resource.fromJson(
    JsonObject json,
  ) =>
      switch (ResourceType.fromCode(json['resourceType'] as String? ?? '')) {
        (ResourceType.appointment) => Appointment.fromJson(json),
        (ResourceType.bundle) => Bundle.fromJson(json),
        (ResourceType.encounter) => Encounter.fromJson(json),
        (ResourceType.observation) => Observation.fromJson(json),
        (ResourceType.organization) => Organization.fromJson(json),
        (ResourceType.operationOutcome) =>
          OperationOutcome<String>.fromJson(json),
        (ResourceType.patient) => Patient.fromJson(json),
        (ResourceType.practitioner) => Practitioner.fromJson(json),
        (ResourceType.practitionerRole) => PractitionerRole.fromJson(json),
        (ResourceType.schedule) => Schedule.fromJson(json),
        (ResourceType.slot) => Slot.fromJson(json),
      };

  final JsonObject json;

  /// The id of the resource
  String? get id => json[Resource.idField.name].stringValue;

  /// The metadata of the resource
  Meta? get meta => switch (json[Resource.metaField.name]) {
        (final JsonObject jo) => Meta.fromJson(jo),
        _ => null,
      };

  static const idField = FieldDefinition(name: 'id', getValue: _getId);
  static const metaField = FieldDefinition(name: 'meta', getValue: _getMeta);

  static const fieldDefinitions = [
    idField,
    metaField,
  ];

  static JsonValue _getId(JsonObject jo) => jo.getValue(idField.name);

  static JsonValue _getMeta(JsonObject jo) => jo.getValue(metaField.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      ((other is Resource) &&
          (other.runtimeType == runtimeType) &&
          (json == other.json));

  @override
  int get hashCode => Object.hash(runtimeType.hashCode, json.hashCode);
}

extension ResourceExtensions<T extends Resource> on T {
  /// Creates a clone of the resource with the provided field updated with
  /// another resource
  T withFieldResource<T2 extends Resource>(
    FieldDefinition<T2> field,
    T2 resource, {
    required T Function(JsonObject) constructor,
  }) =>
      constructor(json.withUpdate(field.name, resource.json));

  UpdateResult<T> withNullField<T2>(
    FieldDefinition<T2> field, {
    required T Function(JsonObject) constructor,
  }) =>
      UpdateSuccess(
        constructor(json.withUpdate(field.name, const JsonNull())),
      );

  UpdateResult<T> withUndefinedField<T2>(
    FieldDefinition<T2> field, {
    required T Function(JsonObject) constructor,
  }) =>
      UpdateSuccess(
        constructor(json.withUpdate(field.name, const Undefined())),
      );
}

/// Represents a booking of a healthcare event among patient(s), practitioner(s),
/// related person(s) and/or device(s) for a specific date/time.
class Appointment extends Resource {
  /// Constructs a new [Appointment].
  Appointment({
    String? id,
    Meta? meta,
    String? status,
    FixedList<CodeableConcept>? serviceCategory,
    FixedList<Participant>? participant,
  }) : super._internal(
          JsonObject({
            if (id != null) 'id': JsonString(id),
            if (meta != null) 'meta': meta.json,
            if (status != null) statusField.name: JsonString(status),
            if (serviceCategory != null)
              serviceCategoryField.name:
                  JsonArray.unmodifiable(serviceCategory.map((e) => e.json)),
            if (participant != null)
              participantField.name:
                  JsonArray.unmodifiable(participant.map((e) => e.json)),
          }),
        );

  /// Constructs a new [Appointment] instance from the provided JSON object.
  Appointment.fromJson(JsonObject jsonObject) : super._internal(jsonObject);

  /// The overall status of the appointment.
  String? get status => statusField.getValue(json);

  /// A broad categorization of the service that is to be performed during this appointment.
  FixedList<CodeableConcept>? get serviceCategory =>
      serviceCategoryField.getValue(json);

  /// List of participants involved in the appointment.
  FixedList<Participant>? get participant => participantField.getValue(json);

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

  /// All field definitions for [Appointment].
  static const fieldDefinitions = [
    ...Resource.fieldDefinitions,
    statusField,
    serviceCategoryField,
    participantField,
  ];

  static String? _getStatus(JsonObject jo) =>
      jo.getValue(statusField.name).stringValue;

  static FixedList<CodeableConcept>? _getServiceCategory(JsonObject jo) =>
      switch (jo['serviceCategory']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Participant>? _getParticipant(JsonObject jo) =>
      switch (jo['participant']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Participant.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

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

  /// Creates a copy of the [Appointment] instance and allows for non-destructive mutation.
  Appointment copyWith({
    String? id,
    Meta? meta,
    String? status,
    FixedList<CodeableConcept>? serviceCategory,
    FixedList<Participant>? participant,
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
    String? id,
    Meta? meta,
    List<Extension>? extension,
    List<Identifier>? identifier,
    bool? active,
    String? type,
    String? name,
    List<CodeableConcept>? code,
    List<Participant>? participant,
    List<Link>? link,
    List<Resource>? entry, // Assuming entry will contain other resources
  }) : this.fromJson(
          JsonObject({
            if (id != null) 'id': JsonString(id),
            if (meta != null) 'meta': meta.json,
            if (extension != null)
              'extension': JsonArray(extension.map((e) => e.json).toList()),
            if (identifier != null)
              'identifier': JsonArray(identifier.map((e) => e.json).toList()),
            if (active != null) 'active': JsonBoolean(active),
            if (type != null) 'type': JsonString(type),
            if (name != null) 'name': JsonString(name),
            if (code != null)
              'code': JsonArray(code.map((e) => e.json).toList()),
            if (participant != null)
              'participant': JsonArray(participant.map((e) => e.json).toList()),
            if (link != null)
              'link': JsonArray(link.map((e) => e.json).toList()),
            if (entry != null)
              'entry': JsonArray(entry.map((e) => e.json).toList()),
          }),
        );

  /// Creates an [Bundle] instance from the provided JSON object.
  Bundle.fromJson(JsonObject json) : super._internal(json);

  /// List of extensions for the bundle
  List<Extension>? get extension => extensionField.getValue(json);

  /// Identifiers associated with the bundle
  List<Identifier>? get identifier => identifierField.getValue(json);

  /// Indicates whether the bundle is currently active
  bool? get active => activeField.getValue(json);

  /// The type of the bundle (e.g., transaction, batch, history)
  String? get type => typeField.getValue(json);

  /// The human-readable name for the bundle
  String? get name => nameField.getValue(json);

  /// Codes identifying the bundle
  List<CodeableConcept>? get code => codeField.getValue(json);

  /// Participants involved in the bundle
  List<Participant>? get participant => participantField.getValue(json);

  /// Links related to the bundle
  List<Link>? get link => linkField.getValue(json);

  /// Entries within the bundle
  List<Resource>? get entry => entryField.getValue(json);

  static const extensionField = FieldDefinition(
    name: 'extension',
    getValue: _getExtension,
  );

  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  static const activeField = FieldDefinition(
    name: 'active',
    getValue: _getActive,
  );

  static const typeField = FieldDefinition(
    name: 'type',
    getValue: _getType,
  );

  static const nameField = FieldDefinition(
    name: 'name',
    getValue: _getName,
  );

  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  static const participantField = FieldDefinition(
    name: 'participant',
    getValue: _getParticipant,
  );

  static const linkField = FieldDefinition(
    name: 'link',
    getValue: _getLink,
  );

  static const entryField = FieldDefinition(
    name: 'entry',
    getValue: _getEntry,
  );

  static List<Extension>? _getExtension(JsonObject jo) =>
      switch (jo['extension']) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => Extension.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo['identifier']) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => Identifier.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static bool? _getActive(JsonObject jo) => jo['active'].booleanValue;

  static String? _getType(JsonObject jo) => jo['type'].stringValue;

  static String? _getName(JsonObject jo) => jo['name'].stringValue;

  static List<CodeableConcept>? _getCode(JsonObject jo) => switch (jo['code']) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => CodeableConcept.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<Participant>? _getParticipant(JsonObject jo) =>
      switch (jo['participant']) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => Participant.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<Link>? _getLink(JsonObject jo) => switch (jo['link']) {
        (final JsonArray jsonArray) =>
          jsonArray.value.map((e) => Link.fromJson(e as JsonObject)).toList(),
        _ => null,
      };

  static List<Resource>? _getEntry(JsonObject jo) => switch (jo['entry']) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => Resource.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  /// Creates a copy of the [Bundle] instance and allows for non-destructive mutation.
  Bundle copyWith({
    String? id,
    Meta? meta,
    List<Extension>? extension,
    List<Identifier>? identifier,
    bool? active,
    String? type,
    String? name,
    List<CodeableConcept>? code,
    List<Participant>? participant,
    List<Link>? link,
    List<Resource>? entry,
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
        participant: participant ?? this.participant,
        link: link ?? this.link,
        entry: entry ?? this.entry,
      );
}

/// An interaction between a patient and healthcare provider(s) for the purpose of providing healthcare service(s) or assessing the health status of a patient.
class Encounter extends Resource {
  /// Constructs a new [Encounter].
  Encounter({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    String? status,
    CodeableConcept? classCode,
    FixedList<CodeableConcept>? type,
    CodeableConcept? serviceType,
    CodeableConcept? priority,
    Reference? subject,
    FixedList<Participant>? participant,
    Period? period,
    Length? length,
    FixedList<CodeableConcept>? reasonCode,
    Hospitalization? hospitalization,
    FixedList<Reference>? location,
  }) : super._internal(
          JsonObject({
            if (id != null) 'id': JsonString(id),
            if (meta != null) 'meta': meta.json,
            if (identifier != null)
              identifierField.name:
                  JsonArray.unmodifiable(identifier.map((e) => e.json)),
            if (status != null) statusField.name: JsonString(status),
            if (classCode != null) classField.name: classCode.json,
            if (type != null)
              typeField.name: JsonArray.unmodifiable(type.map((e) => e.json)),
            if (serviceType != null) serviceTypeField.name: serviceType.json,
            if (priority != null) priorityField.name: priority.json,
            if (subject != null) subjectField.name: subject.json,
            if (participant != null)
              participantField.name:
                  JsonArray.unmodifiable(participant.map((e) => e.json)),
            if (period != null) periodField.name: period.json,
            if (length != null) lengthField.name: length.json,
            if (reasonCode != null)
              reasonCodeField.name:
                  JsonArray.unmodifiable(reasonCode.map((e) => e.json)),
            if (hospitalization != null)
              hospitalizationField.name: hospitalization.json,
            if (location != null)
              locationField.name:
                  JsonArray.unmodifiable(location.map((e) => e.json)),
          }),
        );

  /// Creates an [Encounter] instance from the provided JSON object.
  Encounter.fromJson(JsonObject jsonObject) : super._internal(jsonObject);

  /// Identifier(s) by which this encounter is known.
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  /// The current status of the encounter.
  String? get status => statusField.getValue(json);

  /// Classification of patient encounter context - e.g. Inpatient, outpatient.
  CodeableConcept? get classCode => classField.getValue(json);

  /// Specific type of encounter (e.g. e-mail consultation, surgical day-care, skilled nursing, rehabilitation).
  FixedList<CodeableConcept>? get type => typeField.getValue(json);

  /// Broad categorization of the service that is to be provided (e.g. cardiology).
  CodeableConcept? get serviceType => serviceTypeField.getValue(json);

  /// Indicates the urgency of the encounter.
  CodeableConcept? get priority => priorityField.getValue(json);

  /// The patient or group present at the encounter.
  Reference? get subject => subjectField.getValue(json);

  /// The list of people responsible for providing the service.
  FixedList<Participant>? get participant => participantField.getValue(json);

  /// The start and end time of the encounter.
  Period? get period => periodField.getValue(json);

  /// Quantity of time the encounter lasted. This excludes the time during leaves of absence.
  Length? get length => lengthField.getValue(json);

  /// Reason the encounter takes place, expressed as a code. For admissions, this can be used for a coded admission diagnosis.
  FixedList<CodeableConcept>? get reasonCode => reasonCodeField.getValue(json);

  /// Details about the admission to a healthcare service.
  Hospitalization? get hospitalization => hospitalizationField.getValue(json);

  /// List of locations where the patient has been during this encounter.
  FixedList<Reference>? get location => locationField.getValue(json);

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
    ...Resource.fieldDefinitions,
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

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo[identifierField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static String? _getStatus(JsonObject jo) => jo[statusField.name].stringValue;

  static CodeableConcept? _getClassCode(JsonObject jo) =>
      switch (jo[classField.name]) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<CodeableConcept>? _getType(JsonObject jo) =>
      switch (jo[typeField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static CodeableConcept? _getServiceType(JsonObject jo) =>
      switch (jo[serviceTypeField.name]) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static CodeableConcept? _getPriority(JsonObject jo) =>
      switch (jo[priorityField.name]) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static Reference? _getSubject(JsonObject jo) =>
      switch (jo[subjectField.name]) {
        (final JsonObject jsonObject) => Reference.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<Participant>? _getParticipant(JsonObject jo) =>
      switch (jo[participantField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Participant.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static Period? _getPeriod(JsonObject jo) => switch (jo[periodField.name]) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  static Length? _getLength(JsonObject jo) => switch (jo[lengthField.name]) {
        (final JsonObject jsonObject) => Length.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<CodeableConcept>? _getReasonCode(JsonObject jo) =>
      switch (jo[reasonCodeField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static Hospitalization? _getHospitalization(JsonObject jo) =>
      switch (jo[hospitalizationField.name]) {
        (final JsonObject jsonObject) => Hospitalization.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<Reference>? _getLocation(JsonObject jo) =>
      switch (jo[locationField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

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

  /// Creates a copy of the [Encounter] instance and allows for non-destructive mutation.
  Encounter copyWith({
    FixedList<Identifier>? identifier,
    String? status,
    CodeableConcept? classCode,
    FixedList<CodeableConcept>? type,
    CodeableConcept? serviceType,
    CodeableConcept? priority,
    Reference? subject,
    FixedList<Participant>? participant,
    Period? period,
    Length? length,
    FixedList<CodeableConcept>? reasonCode,
    Hospitalization? hospitalization,
    FixedList<Reference>? location,
  }) =>
      Encounter(
        id: id,
        meta: meta,
        identifier: identifier ?? this.identifier,
        status: status ?? this.status,
        classCode: classCode ?? this.classCode,
        type: type ?? this.type,
        serviceType: serviceType ?? this.serviceType,
        priority: priority ?? this.priority,
        subject: subject ?? this.subject,
        participant: participant ?? this.participant,
        period: period ?? this.period,
        length: length ?? this.length,
        reasonCode: reasonCode ?? this.reasonCode,
        hospitalization: hospitalization ?? this.hospitalization,
        location: location ?? this.location,
      );
}

/// Details about the admission to a healthcare service.
class Hospitalization {
  /// Constructs a new [Hospitalization] with optional admitSource, period, specialCourtesy, destination, and preAdmissionIdentifier.
  Hospitalization({
    AdmitSource? admitSource,
    Period? period,
    FixedList<CodeableConcept>? specialCourtesy,
    FixedList<Location>? destination,
    FixedList<Reference>? preAdmissionIdentifier,
  }) : this.fromJson(
          JsonObject({
            if (admitSource != null) admitSourceField.name: admitSource.json,
            if (period != null) periodField.name: period.json,
            if (specialCourtesy != null)
              specialCourtesyField.name:
                  JsonArray.unmodifiable(specialCourtesy.map((e) => e.json)),
            if (destination != null)
              destinationField.name:
                  JsonArray.unmodifiable(destination.map((e) => e.json)),
            if (preAdmissionIdentifier != null)
              preAdmissionIdentifierField.name: JsonArray.unmodifiable(
                preAdmissionIdentifier.map((e) => e.json),
              ),
          }),
        );

  /// Constructs a new [Hospitalization] instance from the provided JSON object.
  Hospitalization.fromJson(this.json);

  final JsonObject json;

  /// From where patient was admitted (physician referral, transfer).
  AdmitSource? get admitSource => admitSourceField.getValue(json);

  /// The actual or estimated period of admission.
  Period? get period => periodField.getValue(json);

  /// Special courtesies (VIP, board member).
  FixedList<CodeableConcept>? get specialCourtesy =>
      specialCourtesyField.getValue(json);

  /// Location/organization to which the patient is discharged.
  FixedList<Location>? get destination => destinationField.getValue(json);

  /// The pre-admission identifier.
  FixedList<Reference>? get preAdmissionIdentifier =>
      preAdmissionIdentifierField.getValue(json);

  /// Field definition for [admitSource].
  static const admitSourceField = FieldDefinition(
    name: 'admitSource',
    getValue: _getAdmitSource,
  );

  /// Field definition for [period].
  static const periodField = FieldDefinition(
    name: 'period',
    getValue: _getPeriod,
  );

  /// Field definition for [specialCourtesy].
  static const specialCourtesyField = FieldDefinition(
    name: 'specialCourtesy',
    getValue: _getSpecialCourtesy,
  );

  /// Field definition for [destination].
  static const destinationField = FieldDefinition(
    name: 'destination',
    getValue: _getDestination,
  );

  /// Field definition for [preAdmissionIdentifier].
  static const preAdmissionIdentifierField = FieldDefinition(
    name: 'preAdmissionIdentifier',
    getValue: _getPreAdmissionIdentifier,
  );

  /// All field definitions for [Hospitalization].
  static const fieldDefinitions = [
    admitSourceField,
    periodField,
    specialCourtesyField,
    destinationField,
    preAdmissionIdentifierField,
  ];

  static AdmitSource? _getAdmitSource(JsonObject jo) =>
      switch (jo['admitSource']) {
        (final JsonObject jsonObject) => AdmitSource.fromJson(jsonObject),
        _ => null,
      };

  static Period? _getPeriod(JsonObject jo) => switch (jo['period']) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<CodeableConcept>? _getSpecialCourtesy(JsonObject jo) =>
      switch (jo['specialCourtesy']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Location>? _getDestination(JsonObject jo) =>
      switch (jo['destination']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Location.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Reference>? _getPreAdmissionIdentifier(JsonObject jo) =>
      switch (jo['preAdmissionIdentifier']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hospitalization &&
          other.admitSource == admitSource &&
          other.period == period &&
          other.specialCourtesy == specialCourtesy &&
          other.destination == destination &&
          other.preAdmissionIdentifier == preAdmissionIdentifier);

  @override
  int get hashCode => Object.hash(
        admitSource,
        period,
        specialCourtesy,
        destination,
        preAdmissionIdentifier,
      );

  /// Creates a copy of the [Hospitalization] instance and allows for non-destructive mutation.
  Hospitalization copyWith({
    AdmitSource? admitSource,
    Period? period,
    FixedList<CodeableConcept>? specialCourtesy,
    FixedList<Location>? destination,
    FixedList<Reference>? preAdmissionIdentifier,
  }) =>
      Hospitalization(
        admitSource: admitSource ?? this.admitSource,
        period: period ?? this.period,
        specialCourtesy: specialCourtesy ?? this.specialCourtesy,
        destination: destination ?? this.destination,
        preAdmissionIdentifier:
            preAdmissionIdentifier ?? this.preAdmissionIdentifier,
      );
}

/// Measurements and simple assertions made about a patient, device or other subject.
class Observation extends Resource {
  /// Constructs a new [Observation].
  Observation({
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
          JsonObject({
            if (id != null) Resource.idField.name: JsonString(id),
            if (meta != null) Resource.metaField.name: meta.json,
            if (identifier != null)
              identifierField.name:
                  JsonArray.unmodifiable(identifier.map((e) => e.json)),
            if (basedOn != null)
              basedOnField.name:
                  JsonArray.unmodifiable(basedOn.map((e) => e.json)),
            if (partOf != null)
              partOfField.name:
                  JsonArray.unmodifiable(partOf.map((e) => e.json)),
            if (status != null) statusField.name: JsonString(status),
            if (category != null)
              categoryField.name:
                  JsonArray.unmodifiable(category.map((e) => e.json)),
            if (code != null) codeField.name: code.json,
            if (subject != null) subjectField.name: subject.json,
            if (encounter != null) encounterField.name: encounter.json,
            if (effectiveDateTime != null)
              effectiveDateTimeField.name:
                  JsonString(effectiveDateTime.toIso8601String()),
            if (effectivePeriod != null)
              effectivePeriodField.name: effectivePeriod.json,
            if (effectiveTiming != null)
              effectiveTimingField.name: effectiveTiming.json,
            if (effectiveInstant != null)
              effectiveInstantField.name:
                  JsonString(effectiveInstant.toIso8601String()),
            if (issued != null)
              issuedField.name: JsonString(issued.toIso8601String()),
            if (valueQuantity != null)
              valueQuantityField.name: valueQuantity.json,
            if (valueCodeableConcept != null)
              valueCodeableConceptField.name: valueCodeableConcept.json,
            if (valueString != null)
              valueStringField.name: JsonString(valueString),
            if (valueBoolean != null)
              valueBooleanField.name: JsonBoolean(valueBoolean),
            if (valueInteger != null)
              valueIntegerField.name: JsonNumber(valueInteger),
            if (valueRange != null) valueRangeField.name: valueRange.json,
            if (valueRatio != null) valueRatioField.name: valueRatio.json,
            if (valueSampledData != null)
              valueSampledDataField.name: valueSampledData.json,
            if (valueTime != null)
              valueTimeField.name: JsonString(valueTime.toString()),
            if (valueDateTime != null)
              valueDateTimeField.name:
                  JsonString(valueDateTime.toIso8601String()),
            if (valuePeriod != null) valuePeriodField.name: valuePeriod.json,
            if (dataAbsentReason != null)
              dataAbsentReasonField.name: dataAbsentReason.json,
            if (interpretation != null)
              interpretationField.name:
                  JsonArray.unmodifiable(interpretation.map((e) => e.json)),
            if (note != null)
              noteField.name: JsonArray.unmodifiable(note.map((e) => e.json)),
            if (bodySite != null) bodySiteField.name: bodySite.json,
            if (method != null) methodField.name: method.json,
            if (specimen != null) specimenField.name: specimen.json,
            if (device != null) deviceField.name: device.json,
            if (referenceRange != null)
              referenceRangeField.name:
                  JsonArray.unmodifiable(referenceRange.map((e) => e.json)),
            if (hasMember != null)
              hasMemberField.name:
                  JsonArray.unmodifiable(hasMember.map((e) => e.json)),
            if (derivedFrom != null)
              derivedFromField.name:
                  JsonArray.unmodifiable(derivedFrom.map((e) => e.json)),
            if (component != null)
              componentField.name:
                  JsonArray.unmodifiable(component.map((e) => e.json)),
            if (complicatedBy != null)
              complicatedByField.name:
                  JsonArray.unmodifiable(complicatedBy.map((e) => e.json)),
            if (contextOfUse != null)
              contextOfUseField.name:
                  JsonArray.unmodifiable(contextOfUse.map((e) => e.json)),
          }),
        );

  /// Creates an [Observation] instance from the provided JSON object.
  Observation.fromJson(JsonObject jsonObject) : super._internal(jsonObject);

  /// Business identifier for this observation.
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  /// A plan, proposal or order that is fulfilled in whole or in part by this event.
  FixedList<Reference>? get basedOn => basedOnField.getValue(json);

  /// A larger event of which this particular observation is a component or step.
  FixedList<Reference>? get partOf => partOfField.getValue(json);

  /// The status of the result value.
  String? get status => statusField.getValue(json);

  /// A code that classifies the general type of observation being made.
  FixedList<CodeableConcept>? get category => categoryField.getValue(json);

  /// Type of observation (code / type).
  CodeableConcept? get code => codeField.getValue(json);

  /// The patient, or group of patients, location, or device this observation is about and into whose record the observation is placed. If the actual focus of the observation is different from the subject (or a sample of, part, or region of the subject), the `focus` element or the `code` itself specifies the actual focus of the observation.
  Reference? get subject => subjectField.getValue(json);

  /// The healthcare event (e.g. a patient and healthcare provider interaction) during which this observation is made.
  Reference? get encounter => encounterField.getValue(json);

  /// The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the "physiologically relevant time". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself.
  DateTime? get effectiveDateTime => effectiveDateTimeField.getValue(json);

  /// The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the "physiologically relevant time". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself.
  Period? get effectivePeriod => effectivePeriodField.getValue(json);

  /// The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the "physiologically relevant time". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself.
  Timing? get effectiveTiming => effectiveTimingField.getValue(json);

  /// The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the "physiologically relevant time". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself.
  DateTime? get effectiveInstant => effectiveInstantField.getValue(json);

  /// The date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified.
  DateTime? get issued => issuedField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  Quantity? get valueQuantity => valueQuantityField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  CodeableConcept? get valueCodeableConcept =>
      valueCodeableConceptField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  String? get valueString => valueStringField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  bool? get valueBoolean => valueBooleanField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  int? get valueInteger => valueIntegerField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  Range? get valueRange => valueRangeField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  Ratio? get valueRatio => valueRatioField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  SampledData? get valueSampledData => valueSampledDataField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  Time? get valueTime => valueTimeField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  DateTime? get valueDateTime => valueDateTimeField.getValue(json);

  /// The information determined as a result of making the observation, if the information has a simple value.
  Period? get valuePeriod => valuePeriodField.getValue(json);

  /// Provides a reason why the expected value in the element Observation.value[x] is missing.
  CodeableConcept? get dataAbsentReason => dataAbsentReasonField.getValue(json);

  /// A categorical assessment of an observation value. This is often used to supply a "normal" range categorization for numeric values.
  FixedList<CodeableConcept>? get interpretation =>
      interpretationField.getValue(json);

  /// Comments about the observation or the results.
  FixedList<Annotation>? get note => noteField.getValue(json);

  /// Indicates the site on the subject's body where the observation was made (i.e. the target site).
  CodeableConcept? get bodySite => bodySiteField.getValue(json);

  /// Indicates the mechanism used to perform the observation.
  CodeableConcept? get method => methodField.getValue(json);

  /// The specimen that was used when this observation was made.
  Reference? get specimen => specimenField.getValue(json);

  /// The device used to generate the observation data.
  Reference? get device => deviceField.getValue(json);

  /// Guidance on how to interpret the value by comparison to a normal or recommended range.
  FixedList<ObservationReferenceRange>? get referenceRange =>
      referenceRangeField.getValue(json);

  /// This observation is a group observation (e.g. a battery, a panel of tests, a set of vital sign measurements) that includes the target as a member of the group.
  FixedList<Reference>? get hasMember => hasMemberField.getValue(json);

  /// The target resource that represents a measurement from which this observation value is derived. For example, a calculated anion gap or a fetal measurement based on an ultrasound image.
  FixedList<Reference>? get derivedFrom => derivedFromField.getValue(json);

  /// Some observations have multiple component observations. These component observations are expressed as separate code value pairs that share the same attributes. Examples include systolic and diastolic component observations for blood pressure measurement and multiple component observations for genetics observations.
  FixedList<ObservationComponent>? get component =>
      componentField.getValue(json);

  /// The complications or conditions that interfere with the interpretation of the observation.
  FixedList<CodeableReference>? get complicatedBy =>
      complicatedByField.getValue(json);

  /// Details the use context for the Observation, if appropriate.
  FixedList<CodeableReference>? get contextOfUse =>
      contextOfUseField.getValue(json);

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
    ...Resource.fieldDefinitions,
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

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo['identifier']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Reference>? _getBasedOn(JsonObject jo) =>
      switch (jo['basedOn']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Reference>? _getPartOf(JsonObject jo) =>
      switch (jo['partOf']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static String? _getStatus(JsonObject jo) =>
      jo.getValue(statusField.name).stringValue;

  static FixedList<CodeableConcept>? _getCategory(JsonObject jo) =>
      switch (jo['category']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static CodeableConcept? _getCode(JsonObject jo) => switch (jo['code']) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static Reference? _getSubject(JsonObject jo) => switch (jo['subject']) {
        (final JsonObject jsonObject) => Reference.fromJson(jsonObject),
        _ => null,
      };

  static Reference? _getEncounter(JsonObject jo) => switch (jo['encounter']) {
        (final JsonObject jsonObject) => Reference.fromJson(jsonObject),
        _ => null,
      };

  static DateTime? _getEffectiveDateTime(JsonObject jo) => DateTime.tryParse(
        jo.getValue(effectiveDateTimeField.name).stringValue ?? '',
      );

  static Period? _getEffectivePeriod(JsonObject jo) =>
      switch (jo['effectivePeriod']) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  static Timing? _getEffectiveTiming(JsonObject jo) =>
      switch (jo['effectiveTiming']) {
        (final JsonObject jsonObject) => Timing.fromJson(jsonObject),
        _ => null,
      };

  static DateTime? _getEffectiveInstant(JsonObject jo) => DateTime.tryParse(
        jo.getValue(effectiveInstantField.name).stringValue ?? '',
      );

  static DateTime? _getIssued(JsonObject jo) =>
      DateTime.tryParse(jo.getValue(issuedField.name).stringValue ?? '');

  static Quantity? _getValueQuantity(JsonObject jo) =>
      switch (jo['valueQuantity']) {
        (final JsonObject jsonObject) => Quantity.fromJson(jsonObject),
        _ => null,
      };

  static CodeableConcept? _getValueCodeableConcept(JsonObject jo) =>
      switch (jo['valueCodeableConcept']) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static String? _getValueString(JsonObject jo) =>
      jo.getValue(valueStringField.name).stringValue;

  static bool? _getValueBoolean(JsonObject jo) =>
      jo.getValue(valueBooleanField.name).booleanValue;

  static int? _getValueInteger(JsonObject jo) =>
      jo.getValue(valueIntegerField.name).numericValue?.toInt();

  static Range? _getValueRange(JsonObject jo) => switch (jo['valueRange']) {
        (final JsonObject jsonObject) => Range.fromJson(jsonObject),
        _ => null,
      };

  static Ratio? _getValueRatio(JsonObject jo) => switch (jo['valueRatio']) {
        (final JsonObject jsonObject) => Ratio.fromJson(jsonObject),
        _ => null,
      };

  static SampledData? _getValueSampledData(JsonObject jo) =>
      switch (jo['valueSampledData']) {
        (final JsonObject jsonObject) => SampledData.fromJson(jsonObject),
        _ => null,
      };

  static Time? _getValueTime(JsonObject jo) =>
      Time.tryParse(jo.getValue(valueTimeField.name).stringValue ?? '');

  static DateTime? _getValueDateTime(JsonObject jo) =>
      DateTime.tryParse(jo.getValue(valueDateTimeField.name).stringValue ?? '');

  static Period? _getValuePeriod(JsonObject jo) => switch (jo['valuePeriod']) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  static CodeableConcept? _getDataAbsentReason(JsonObject jo) =>
      switch (jo['dataAbsentReason']) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<CodeableConcept>? _getInterpretation(JsonObject jo) =>
      switch (jo['interpretation']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Annotation>? _getNote(JsonObject jo) => switch (jo['note']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Annotation.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static CodeableConcept? _getBodySite(JsonObject jo) =>
      switch (jo['bodySite']) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static CodeableConcept? _getMethod(JsonObject jo) => switch (jo['method']) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static Reference? _getSpecimen(JsonObject jo) => switch (jo['specimen']) {
        (final JsonObject jsonObject) => Reference.fromJson(jsonObject),
        _ => null,
      };

  static Reference? _getDevice(JsonObject jo) => switch (jo['device']) {
        (final JsonObject jsonObject) => Reference.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<ObservationReferenceRange>? _getReferenceRange(
    JsonObject jo,
  ) =>
      switch (jo['referenceRange']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map(
              (e) => ObservationReferenceRange.fromJson(e as JsonObject),
            ),
          ),
        _ => null,
      };

  static FixedList<Reference>? _getHasMember(JsonObject jo) =>
      switch (jo['hasMember']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Reference>? _getDerivedFrom(JsonObject jo) =>
      switch (jo['derivedFrom']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<ObservationComponent>? _getComponent(JsonObject jo) =>
      switch (jo['component']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => ObservationComponent.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<CodeableReference>? _getComplicatedBy(JsonObject jo) =>
      switch (jo['complicatedBy']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableReference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<CodeableReference>? _getContextOfUse(JsonObject jo) =>
      switch (jo['contextOfUse']) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableReference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  /// Creates a copy of the [Observation] instance and allows
  /// for non-destructive mutation.
  Observation copyWith({
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
  }) =>
      Observation(
        id: id ?? this.id,
        meta: meta ?? this.meta,
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
    String? id,
    Meta? meta,
    Text? text,
    FixedList<Issue>? issue,
  }) : super._internal(
          JsonObject({
            if (id != null) Resource.idField.name: JsonString(id),
            if (meta != null) Resource.metaField.name: meta.json,
            if (text != null) textField.name: text.json,
            if (issue != null)
              issueField.name: JsonArray.unmodifiable(issue.map((e) => e.json)),
          }),
        );

  /// Creates an [OperationOutcome] instance from the provided JSON object.
  OperationOutcome.fromJson(JsonObject json) : super._internal(json);

  OperationOutcome.error({required String message, required String details})
      : this(
          text: Text(
            status: message,
            div: details,
          ),
        );

  /// A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human.
  Text? get text => textField.getValue(json);

  /// A single issue associated with the action.
  FixedList<Issue>? get issue => issueField.getValue(json);

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

  static Text? _getText(JsonObject jo) => switch (jo[textField.name]) {
        (final JsonObject jsonObject) => Text.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<Issue>? _getIssue(JsonObject jo) =>
      switch (jo[issueField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Issue.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

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
    String? id,
    Meta? meta,
    Text? text,
    FixedList<Issue>? issue,
  }) =>
      OperationOutcome<T>(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        text: text ?? this.text,
        issue: issue ?? this.issue,
      );
}

/// A formally or informally recognized grouping of people or organizations formed for the purpose of achieving some form of collective action. Includes companies, institutions, corporations, departments, community groups, healthcare practice groups, payer/insurer, etc.
class Organization extends Resource {
  /// Constructs a new [Organization].
  Organization({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    FixedList<CodeableConcept>? type,
    String? name,
    String? alias,
    FixedList<ContactPoint>? telecom,
    FixedList<Address>? address,
    Reference? partOf,
    FixedList<Reference>? contact,
    FixedList<Reference>? endpoint,
    bool? active,
  }) : super._internal(
          JsonObject({
            if (id != null) Resource.idField.name: JsonString(id),
            if (meta != null) Resource.metaField.name: meta.json,
            if (identifier != null)
              identifierField.name:
                  JsonArray.unmodifiable(identifier.map((e) => e.json)),
            if (type != null)
              typeField.name: JsonArray.unmodifiable(type.map((e) => e.json)),
            if (name != null) nameField.name: JsonString(name),
            if (alias != null) aliasField.name: JsonString(alias),
            if (telecom != null)
              telecomField.name:
                  JsonArray.unmodifiable(telecom.map((e) => e.json)),
            if (address != null)
              addressField.name:
                  JsonArray.unmodifiable(address.map((e) => e.json)),
            if (partOf != null) partOfField.name: partOf.json,
            if (contact != null)
              contactField.name:
                  JsonArray.unmodifiable(contact.map((e) => e.json)),
            if (endpoint != null)
              endpointField.name:
                  JsonArray.unmodifiable(endpoint.map((e) => e.json)),
            if (active != null) activeField.name: JsonBoolean(active),
          }),
        );

  /// Creates an [Organization] instance from the provided JSON object.
  Organization.fromJson(JsonObject json) : super._internal(json);

  /// Identifier for the organization that is used to identify the organization across multiple disparate systems.
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  /// The kind(s) of organization that this is.
  FixedList<CodeableConcept>? get type => typeField.getValue(json);

  /// A name associated with the organization.
  String? get name => nameField.getValue(json);

  /// A list of alternate names that the organization is known as, or was known as in the past.
  String? get alias => aliasField.getValue(json);

  /// A contact detail for the organization.
  FixedList<ContactPoint>? get telecom => telecomField.getValue(json);

  /// An address for the organization.
  FixedList<Address>? get address => addressField.getValue(json);

  /// The organization of which this organization forms a part.
  Reference? get partOf => partOfField.getValue(json);

  /// Contact for the organization for a certain purpose.
  FixedList<Reference>? get contact => contactField.getValue(json);

  /// Technical endpoints providing access to services operated for the organization.
  FixedList<Reference>? get endpoint => endpointField.getValue(json);

  /// Whether the organization's record is still in active use.
  bool? get active => activeField.getValue(json);

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

  /// Field definition for [alias].
  static const aliasField = FieldDefinition(
    name: 'alias',
    getValue: _getAlias,
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

  /// Field definition for [partOf].
  static const partOfField = FieldDefinition(
    name: 'partOf',
    getValue: _getPartOf,
  );

  /// Field definition for [contact].
  static const contactField = FieldDefinition(
    name: 'contact',
    getValue: _getContact,
  );

  /// Field definition for [endpoint].
  static const endpointField = FieldDefinition(
    name: 'endpoint',
    getValue: _getEndpoint,
  );

  /// Field definition for [active].
  static const activeField = FieldDefinition(
    name: 'active',
    getValue: _getActive,
  );

  /// All field definitions for [Organization].
  static const fieldDefinitions = [
    ...Resource.fieldDefinitions,
    identifierField,
    typeField,
    nameField,
    aliasField,
    telecomField,
    addressField,
    partOfField,
    contactField,
    endpointField,
    activeField,
  ];

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo[identifierField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<CodeableConcept>? _getType(JsonObject jo) =>
      switch (jo[typeField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static String? _getName(JsonObject jo) => jo[nameField.name].stringValue;

  static String? _getAlias(JsonObject jo) => jo[aliasField.name].stringValue;

  static FixedList<ContactPoint>? _getTelecom(JsonObject jo) =>
      switch (jo[telecomField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => ContactPoint.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Address>? _getAddress(JsonObject jo) =>
      switch (jo[addressField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Address.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static Reference? _getPartOf(JsonObject jo) => switch (jo[partOfField.name]) {
        (final JsonObject jsonObject) => Reference.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<Reference>? _getContact(JsonObject jo) =>
      switch (jo[contactField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Reference>? _getEndpoint(JsonObject jo) =>
      switch (jo[endpointField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static bool? _getActive(JsonObject jo) => jo[activeField.name].booleanValue;

  /// Creates a copy of the [Organization] instance and allows for non-destructive mutation.
  Organization copyWith({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    FixedList<CodeableConcept>? type,
    String? name,
    String? alias,
    FixedList<ContactPoint>? telecom,
    FixedList<Address>? address,
    Reference? partOf,
    FixedList<Reference>? contact,
    FixedList<Reference>? endpoint,
    bool? active,
  }) =>
      Organization(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        type: type ?? this.type,
        name: name ?? this.name,
        alias: alias ?? this.alias,
        telecom: telecom ?? this.telecom,
        address: address ?? this.address,
        partOf: partOf ?? this.partOf,
        contact: contact ?? this.contact,
        endpoint: endpoint ?? this.endpoint,
        active: active ?? this.active,
      );
}

/// Demographics and other administrative information about an individual or animal receiving care or other health-related services.
class Patient extends Resource {
  /// Constructs a new [Patient].
  Patient({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    bool? active,
    FixedList<Name>? name,
    FixedList<ContactPoint>? telecom,
    AdministrativeGender? gender,
    DateTime? birthDate,
    FixedList<Address>? address,
  }) : super._internal(
          JsonObject({
            if (id != null) Resource.idField.name: JsonString(id),
            if (meta != null) Resource.metaField.name: meta.json,
            if (identifier != null)
              identifierField.name:
                  JsonArray.unmodifiable(identifier.map((e) => e.json)),
            if (active != null) activeField.name: JsonBoolean(active),
            if (name != null)
              nameField.name: JsonArray.unmodifiable(name.map((e) => e.json)),
            if (telecom != null)
              telecomField.name:
                  JsonArray.unmodifiable(telecom.map((e) => e.json)),
            if (gender != null) genderField.name: JsonString(gender.code),
            if (birthDate != null)
              birthDateField.name: JsonString(birthDate.toIso8601String()),
            if (address != null)
              addressField.name:
                  JsonArray.unmodifiable(address.map((e) => e.json)),
          }),
        );

  /// Creates a [Patient] instance from the provided JSON object.
  Patient.fromJson(JsonObject json) : super._internal(json);

  /// An identifier for this patient.
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  /// Whether this patient record is in active use.
  bool? get active => activeField.getValue(json);

  /// A name associated with the patient.
  FixedList<Name>? get name => nameField.getValue(json);

  /// A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.
  FixedList<ContactPoint>? get telecom => telecomField.getValue(json);

  /// Administrative Gender - the gender that the patient is considered to have for administration and record keeping purposes.
  AdministrativeGender? get gender => genderField.getValue(json);

  /// The date of birth for the individual.
  DateTime? get birthDate => birthDateField.getValue(json);

  /// An address for the individual.
  FixedList<Address>? get address => addressField.getValue(json);

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
  );

  /// Field definition for [active].
  static const activeField = FieldDefinition(
    name: 'active',
    getValue: _getActive,
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
  static const fieldDefinitions = [
    ...Resource.fieldDefinitions,
    identifierField,
    activeField,
    nameField,
    telecomField,
    genderField,
    birthDateField,
    addressField,
  ];

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo[identifierField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static bool? _getActive(JsonObject jo) => jo[activeField.name].booleanValue;

  static FixedList<Name>? _getName(JsonObject jo) =>
      switch (jo[nameField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Name.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<ContactPoint>? _getTelecom(JsonObject jo) =>
      switch (jo[telecomField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => ContactPoint.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static AdministrativeGender? _getGender(JsonObject jo) =>
      switch (jo[genderField.name]) {
        (final JsonString jsonString) =>
          AdministrativeGender.fromCode(jsonString.value),
        _ => null,
      };

  static DateTime? _getBirthDate(JsonObject jo) => DateTime.tryParse(
        jo[birthDateField.name].stringValue ?? '',
      );

  static FixedList<Address>? _getAddress(JsonObject jo) =>
      switch (jo[addressField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Address.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  /// Creates a copy of the [Patient] instance and allows for non-destructive mutation.
  Patient copyWith({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    bool? active,
    FixedList<Name>? name,
    FixedList<ContactPoint>? telecom,
    AdministrativeGender? gender,
    DateTime? birthDate,
    FixedList<Address>? address,
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
    Definable<FixedList<ContactPoint>> telecom = const Undefined(),
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
            if (telecom is Defined<FixedList<ContactPoint>>)
              telecom.toMapEntry(),
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
  Definable<FixedList<ContactPoint>> get telecom => telecomField.getValue(this);

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

  static Definable<FixedList<ContactPoint>> _getTelecom(JsonObject jo) =>
      jo.getValueFromObjectArray(
        'telecom',
        fromObjectArray: (jsonTags) => jsonTags
            ?.map((dm) => ContactPoint.fromJson(dm as Map<String, dynamic>))
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
    Definable<FixedList<ContactPoint>>? telecom,
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

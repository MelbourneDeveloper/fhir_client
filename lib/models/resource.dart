// ignore_for_file: lines_longer_than_80_chars, comment_references, use_super_parameters

import 'package:fhir_client/attachment.dart';
import 'package:fhir_client/models/address.dart';
import 'package:fhir_client/models/admit_source.dart';
import 'package:fhir_client/models/annotation.dart';
import 'package:fhir_client/models/available_time.dart';
import 'package:fhir_client/models/backbone_element.dart';
import 'package:fhir_client/models/basic_types/choice_types.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/basic_types/jayse_extensions.dart';
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
import 'package:fhir_client/models/narrative.dart';
import 'package:fhir_client/models/not_available.dart';
import 'package:fhir_client/models/observation_component.dart';
import 'package:fhir_client/models/observation_reference_range.dart';
import 'package:fhir_client/models/participant.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/quantity.dart';
import 'package:fhir_client/models/range.dart';
import 'package:fhir_client/models/ratio.dart';
import 'package:fhir_client/models/reference.dart';
import 'package:fhir_client/models/sampled_data.dart';
import 'package:fhir_client/models/timing.dart';
import 'package:fhir_client/models/value_sets/administrative_gender.dart';
import 'package:fhir_client/models/value_sets/appointment_reason.dart';
import 'package:fhir_client/models/value_sets/appointment_status.dart';
import 'package:fhir_client/models/value_sets/cancelation_reason.dart';
import 'package:fhir_client/models/value_sets/encounter_status.dart';
import 'package:fhir_client/models/value_sets/language.dart';
import 'package:fhir_client/models/value_sets/marital_status.dart';
import 'package:fhir_client/models/value_sets/resource_type.dart';
import 'package:fhir_client/models/value_sets/service_category.dart';
import 'package:fhir_client/models/value_sets/service_type.dart';
import 'package:fhir_client/models/value_sets/slot_status.dart';
import 'package:fhir_client/validation/field_definition.dart';
import 'package:jayse/jayse.dart';

const _resourceTypeFieldName = 'resourceType';

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

/// The basic building block for all FHIR resources
class Element {
  /// Constructs a new [Element]
  Element(this.json);

  /// Converts this [Meta] instance to a JSON object.
  final JsonObject json;

  /// The id of the resource
  String? get id => json[idField.name].stringValue;

  /// The metadata of the resource
  Meta? get meta => switch (json[metaField.name]) {
        (final JsonObject jo) => Meta.fromJson(jo),
        _ => null,
      };

  /// The id of the resource
  static const idField = FieldDefinition(
    name: 'id',
    display: 'Id',
    getValue: _getId,
    description: 'The resource ID',
  );

  /// The metadata of the resource
  static const metaField = FieldDefinition(
    name: 'meta',
    display: 'Meta',
    getValue: _getMeta,
    description: 'The metadata of the resource',
  );

  static const fieldDefinitions = [
    idField,
    metaField,
  ];

  static String? _getId(JsonObject jo) => switch (jo[idField.name]) {
        (final JsonString js) => js.value,
        _ => null,
      };

  static Meta? _getMeta(JsonObject jo) => switch (jo[metaField.name]) {
        (final JsonObject jsonObject) => Meta.fromJson(jsonObject),
        _ => null,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      ((other is Resource) &&
          (other.runtimeType == runtimeType) &&
          (json == other.json));

  @override
  int get hashCode => Object.hash(runtimeType.hashCode, json.hashCode);
}

/// Any of the FHIR resources
sealed class Resource extends Element {
  Resource._internal(JsonObject json) : super(json);

  factory Resource.fromJson(
    JsonObject json,
  ) {
    final resourceTypeString = json[_resourceTypeFieldName].stringValue;

    if (resourceTypeString == null) {
      return OperationOutcome<String>(
        text: Narrative(status: NarrativeStatus.empty),
      );
    }

    return switch (ResourceType.fromCode(resourceTypeString)) {
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
  }
}

extension ResourceExtensions<T extends Resource> on T {
  /// Creates a clone of the resource with the provided field updated with
  /// another resource
  T withFieldValue(
    // ignore: strict_raw_type
    FieldDefinition field,
    JsonValue value, {
    required T Function(JsonObject) constructor,
  }) =>
      constructor(json.withUpdate(field.name, value));

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

/// A booking of a healthcare event among patient(s), practitioner(s), related person(s) and/or device(s) for a specific date/time. This may result in one or more Encounter(s).
class Appointment extends Resource {
  /// Constructs a new [Appointment].
  Appointment({
    String? id,
    Meta? meta,
    Uri? implicitRules,
    Language? language,
    Narrative? text,
    FixedList<Resource>? contained,
    FixedList<Extension>? extension,
    FixedList<Extension>? modifierExtension,
    FixedList<Identifier>? identifier,
    AppointmentStatus? status,
    CancelationReason? cancelationReason,
    FixedList<ServiceCategory>? serviceCategory,
    FixedList<ServiceType>? serviceType,
    FixedList<CodeableConcept>? specialty,
    AppointmentReason? appointmentType,
    FixedList<CodeableConcept>? reasonCode,
    FixedList<Reference>? reasonReference,
    int? priority,
    String? description,
    FixedList<Reference>? supportingInformation,
    DateTime? start,
    DateTime? end,
    int? minutesDuration,
    FixedList<Reference>? slot,
    DateTime? created,
    String? comment,
    String? patientInstruction,
    FixedList<Reference>? basedOn,
    FixedList<BackboneElement>? participant,
    FixedList<Period>? requestedPeriod,
  }) : super._internal(
          JsonObject({
            if (id != null) idField.name: JsonString(id),
            if (meta != null) metaField.name: meta.json,
            if (implicitRules != null)
              implicitRulesField.name: JsonString(implicitRules.toString()),
            if (language != null) languageField.name: language.json,
            if (text != null) textField.name: text.json,
            if (contained != null)
              containedField.name: JsonArray.unmodifiable(
                contained.map((e) => e.json),
              ),
            if (extension != null)
              extensionField.name: JsonArray.unmodifiable(
                extension.map((e) => e.json),
              ),
            if (modifierExtension != null)
              modifierExtensionField.name: JsonArray.unmodifiable(
                modifierExtension.map((e) => e.json),
              ),
            if (identifier != null)
              identifierField.name: JsonArray.unmodifiable(
                identifier.map((e) => e.json),
              ),
            if (status != null) statusField.name: status.json,
            if (cancelationReason != null)
              cancelationReasonField.name: cancelationReason.json,
            if (serviceCategory != null)
              serviceCategoryField.name: JsonArray.unmodifiable(
                serviceCategory.map((e) => e.json),
              ),
            if (serviceType != null)
              serviceTypeField.name: JsonArray.unmodifiable(
                serviceType.map((e) => e.json),
              ),
            if (specialty != null)
              specialtyField.name: JsonArray.unmodifiable(
                specialty.map((e) => e.json),
              ),
            if (appointmentType != null)
              appointmentTypeField.name: appointmentType.json,
            if (reasonCode != null)
              reasonCodeField.name: JsonArray.unmodifiable(
                reasonCode.map((e) => e.json),
              ),
            if (reasonReference != null)
              reasonReferenceField.name: JsonArray.unmodifiable(
                reasonReference.map((e) => e.json),
              ),
            if (priority != null) priorityField.name: JsonNumber(priority),
            if (description != null)
              descriptionField.name: JsonString(description),
            if (supportingInformation != null)
              supportingInformationField.name: JsonArray.unmodifiable(
                supportingInformation.map((e) => e.json),
              ),
            if (start != null)
              startField.name: JsonString(start.toIso8601String()),
            if (end != null) endField.name: JsonString(end.toIso8601String()),
            if (minutesDuration != null)
              minutesDurationField.name: JsonNumber(minutesDuration),
            if (slot != null)
              slotField.name: JsonArray.unmodifiable(
                slot.map((e) => e.json),
              ),
            if (created != null)
              createdField.name: JsonString(created.toIso8601String()),
            if (comment != null) commentField.name: JsonString(comment),
            if (patientInstruction != null)
              patientInstructionField.name: JsonString(patientInstruction),
            if (basedOn != null)
              basedOnField.name: JsonArray.unmodifiable(
                basedOn.map((e) => e.json),
              ),
            if (participant != null)
              participantField.name: JsonArray.unmodifiable(
                participant.map((e) => e.json),
              ),
            if (requestedPeriod != null)
              requestedPeriodField.name: JsonArray.unmodifiable(
                requestedPeriod.map((e) => e.json),
              ),
            _resourceTypeFieldName: const JsonString('Appointment'),
          }),
        );

  /// Creates a [Appointment] instance from the provided JSON object.
  Appointment.fromJson(JsonObject json) : super._internal(json);

  // Getters

  ///A reference to a set of rules that were followed when the resource was cons
  ///tructed, and which must be understood when processing the content. Often, t
  ///his is a reference to an implementation guide that defines the special rule
  ///s along with other profiles etc.
  Uri? get implicitRules => implicitRulesField.getValue(json);

  ///The base language in which the resource is written.
  Language? get language => languageField.getValue(json);

  ///A human-readable narrative that contains a summary of the resource and can
  ///be used to represent the content of the resource to a human. The narrative
  ///need not encode all the structured data, but is required to contain suffici
  ///ent detail to make it "clinically safe" for a human to just read the narrat
  ///ive. Resource definitions may define what content should be represented in
  ///the narrative to ensure clinical safety.
  Narrative? get text => textField.getValue(json);

  ///These resources do not have an independent existence apart from the resourc
  ///e that contains them - they cannot be identified independently, and nor can
  /// they have their own independent transaction scope.
  FixedList<Resource>? get contained => containedField.getValue(json);

  ///May be used to represent additional information that is not part of the bas
  ///ic definition of the resource. To make the use of extensions safe and manag
  ///eable, there is a strict set of governance  applied to the definition and u
  ///se of extensions. Though any implementer can define an extension, there is
  ///a set of requirements that SHALL be met as part of the definition of the ex
  ///tension.
  FixedList<Extension>? get extension => extensionField.getValue(json);

  ///May be used to represent additional information that is not part of the bas
  ///ic definition of the resource and that modifies the understanding of the el
  ///ement that contains it and/or the understanding of the containing element's
  /// descendants. Usually modifier elements provide negation or qualification.
  ///To make the use of extensions safe and manageable, there is a strict set of
  /// governance applied to the definition and use of extensions. Though any imp
  ///lementer is allowed to define an extension, there is a set of requirements
  ///that SHALL be met as part of the definition of the extension. Applications
  ///processing a resource are required to check for modifier extensions.Modifie
  ///r extensions SHALL NOT change the meaning of any elements on Resource or Do
  ///mainResource (including cannot change the meaning of modifierExtension itse
  ///lf).
  FixedList<Extension>? get modifierExtension =>
      modifierExtensionField.getValue(json);

  ///This records identifiers associated with this appointment concern that are
  ///defined by business processes and/or used to refer to it when a direct URL
  ///reference to the resource itself is not appropriate (e.g. in CDA documents,
  /// or in written / printed documentation).
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  ///The overall status of the Appointment. Each of the participants has their o
  ///wn participation status which indicates their involvement in the process, h
  ///owever this status indicates the shared status.
  AppointmentStatus? get status => statusField.getValue(json);

  ///The coded reason for the appointment being cancelled. This is often used in
  /// reporting/billing/futher processing to determine if further actions are re
  ///quired, or specific fees apply.
  CancelationReason? get cancelationReason =>
      cancelationReasonField.getValue(json);

  ///A broad categorization of the service that is to be performed during this a
  ///ppointment.
  FixedList<ServiceCategory>? get serviceCategory =>
      serviceCategoryField.getValue(json);

  ///The specific service that is to be performed during this appointment.
  FixedList<ServiceType>? get serviceType => serviceTypeField.getValue(json);

  ///The specialty of a practitioner that would be required to perform the servi
  ///ce requested in this appointment.
  FixedList<CodeableConcept>? get specialty => specialtyField.getValue(json);

  ///The style of appointment or patient that has been booked in the slot (not s
  ///ervice type).
  AppointmentReason? get appointmentType => appointmentTypeField.getValue(json);

  ///The coded reason that this appointment is being scheduled. This is more cli
  ///nical than administrative.
  FixedList<CodeableConcept>? get reasonCode => reasonCodeField.getValue(json);

  ///Reason the appointment has been scheduled to take place, as specified using
  /// information from another resource. When the patient arrives and the encoun
  ///ter begins it may be used as the admission diagnosis. The indication will t
  ///ypically be a Condition (with other resources referenced in the evidence.de
  ///tail), or a Procedure.
  FixedList<Reference>? get reasonReference =>
      reasonReferenceField.getValue(json);

  ///The priority of the appointment. Can be used to make informed decisions if
  ///needing to re-prioritize appointments. (The iCal Standard specifies 0 as un
  ///defined, 1 as highest, 9 as lowest priority).
  int? get priority => priorityField.getValue(json);

  ///The brief description of the appointment as would be shown on a subject lin
  ///e in a meeting request, or appointment list. Detailed or expanded informati
  ///on should be put in the comment field.
  String? get description => descriptionField.getValue(json);

  ///Additional information to support the appointment provided when making the
  ///appointment.
  FixedList<Reference>? get supportingInformation =>
      supportingInformationField.getValue(json);

  ///Date/Time that the appointment is to take place.
  DateTime? get start => startField.getValue(json);

  ///Date/Time that the appointment is to conclude.
  DateTime? get end => endField.getValue(json);

  ///Number of minutes that the appointment is to take. This can be less than th
  ///e duration between the start and end times.  For example, where the actual
  ///time of appointment is only an estimate or if a 30 minute appointment is be
  ///ing requested, but any time would work.  Also, if there is, for example, a
  ///planned 15 minute break in the middle of a long appointment, the duration m
  ///ay be 15 minutes less than the difference between the start and end.
  int? get minutesDuration => minutesDurationField.getValue(json);

  ///The slots from the participants' schedules that will be filled by the appoi
  ///ntment.
  FixedList<Reference>? get slot => slotField.getValue(json);

  ///The date that this appointment was initially created. This could be differe
  ///nt to the meta.lastModified value on the initial entry, as this could have
  ///been before the resource was created on the FHIR server, and should remain
  ///unchanged over the lifespan of the appointment.
  DateTime? get created => createdField.getValue(json);

  ///Additional comments about the appointment.
  String? get comment => commentField.getValue(json);

  ///While Appointment.comment contains information for internal use, Appointmen
  ///t.patientInstructions is used to capture patient facing information about t
  ///he Appointment (e.g. please bring your referral or fast from 8pm night befo
  ///re).
  String? get patientInstruction => patientInstructionField.getValue(json);

  ///The service request this appointment is allocated to assess (e.g. incoming
  ///referral or procedure request).
  FixedList<Reference>? get basedOn => basedOnField.getValue(json);

  ///List of participants involved in the appointment.
  FixedList<BackboneElement>? get participant =>
      participantField.getValue(json);

  ///A set of date ranges (potentially including times) that the appointment is
  ///preferred to be scheduled within.The duration (usually in minutes) could al
  ///so be provided to indicate the length of the appointment to fill and popula
  ///te the start/end times for the actual allocated time. However, in other sit
  ///uations the duration may be calculated by the scheduling system.
  FixedList<Period>? get requestedPeriod => requestedPeriodField.getValue(json);

  // Static Get Methods

  static String? _getId(JsonObject jo) => jo[idField.name].stringValue;

  static Meta? _getMeta(JsonObject jo) => switch (jo[metaField.name]) {
        (final JsonObject jsonObject) => Meta.fromJson(jsonObject),
        _ => null,
      };

  static Uri? _getImplicitRules(JsonObject jo) =>
      jo[implicitRulesField.name].uriValue;

  static Language? _getLanguage(JsonObject jo) =>
      switch (jo[languageField.name]) {
        (final JsonString js) => Language.fromCode(js.value),
        _ => null,
      };

  static Narrative? _getText(JsonObject jo) => switch (jo[textField.name]) {
        (final JsonObject jsonObject) => Narrative.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<Resource>? _getContained(JsonObject jo) =>
      switch (jo[containedField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Resource.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Extension>? _getExtension(JsonObject jo) =>
      switch (jo[extensionField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Extension.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Extension>? _getModifierExtension(JsonObject jo) =>
      switch (jo[modifierExtensionField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Extension.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo[identifierField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static AppointmentStatus? _getStatus(JsonObject jo) =>
      switch (jo[statusField.name]) {
        (final JsonString js) => AppointmentStatus.fromCode(js.value),
        _ => null,
      };

  static CancelationReason? _getCancelationReason(JsonObject jo) =>
      switch (jo[cancelationReasonField.name]) {
        (final JsonString js) => CancelationReason.fromCode(js.value),
        _ => null,
      };

  static FixedList<ServiceCategory>? _getServiceCategory(JsonObject jo) =>
      switch (jo[serviceCategoryField.name]) {
        final JsonArray jsonArray => switch ([
            for (final jv in jsonArray.value)
              switch (jv) {
                final JsonString s => ServiceCategory.fromCode(s.value),
                _ => null
              },
          ]) {
            //All items are [ServiceCategory] strings
            final List<ServiceCategory> items => FixedList(items),
            //Some items are not [ServiceCategory] strings
            _ => null
          },
        // Not a JsonArray
        _ => null
      };

  static FixedList<ServiceType>? _getServiceType(JsonObject jo) =>
      switch (jo[serviceTypeField.name]) {
        final JsonArray jsonArray => switch ([
            for (final jv in jsonArray.value)
              switch (jv) {
                final JsonString s => ServiceType.fromCode(s.value),
                _ => null
              },
          ]) {
            //All items are [ServiceType] strings
            final List<ServiceType> items => FixedList(items),
            //Some items are not [ServiceType] strings
            _ => null
          },
        // Not a JsonArray
        _ => null
      };

  static FixedList<CodeableConcept>? _getSpecialty(JsonObject jo) =>
      switch (jo[specialtyField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static AppointmentReason? _getAppointmentType(JsonObject jo) =>
      switch (jo[appointmentTypeField.name]) {
        (final JsonString js) => AppointmentReason.fromCode(js.value),
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

  static FixedList<Reference>? _getReasonReference(JsonObject jo) =>
      switch (jo[reasonReferenceField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static int? _getPriority(JsonObject jo) =>
      jo[priorityField.name].integerValue;

  static String? _getDescription(JsonObject jo) =>
      jo[descriptionField.name].stringValue;

  static FixedList<Reference>? _getSupportingInformation(JsonObject jo) =>
      switch (jo[supportingInformationField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static DateTime? _getStart(JsonObject jo) =>
      DateTime.tryParse(jo[startField.name].stringValue ?? '');

  static DateTime? _getEnd(JsonObject jo) =>
      DateTime.tryParse(jo[endField.name].stringValue ?? '');

  static int? _getMinutesDuration(JsonObject jo) =>
      jo[minutesDurationField.name].integerValue;

  static FixedList<Reference>? _getSlot(JsonObject jo) =>
      switch (jo[slotField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static DateTime? _getCreated(JsonObject jo) =>
      DateTime.tryParse(jo[createdField.name].stringValue ?? '');

  static String? _getComment(JsonObject jo) =>
      jo[commentField.name].stringValue;

  static String? _getPatientInstruction(JsonObject jo) =>
      jo[patientInstructionField.name].stringValue;

  static FixedList<Reference>? _getBasedOn(JsonObject jo) =>
      switch (jo[basedOnField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<BackboneElement>? _getParticipant(JsonObject jo) =>
      switch (jo[participantField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => BackboneElement.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Period>? _getRequestedPeriod(JsonObject jo) =>
      switch (jo[requestedPeriodField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Period.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  // Field Definitions

  /// Field definition for [id].
  static const idField = FieldDefinition(
    name: 'id',
    getValue: _getId,
    description: '''
The logical id of the resource, as used in the URL for the resource. Once assigned, this value never changes.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [meta].
  static const metaField = FieldDefinition(
    name: 'meta',
    getValue: _getMeta,
    description: '''
The metadata about the resource. This is content that is maintained by the infrastructure. Changes to the content might not always be associated with version changes to the resource.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [implicitRules].
  static const implicitRulesField = FieldDefinition(
    name: 'implicitRules',
    getValue: _getImplicitRules,
    description: '''
A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [language].
  static const languageField = FieldDefinition(
    name: 'language',
    getValue: _getLanguage,
    description: '''
The base language in which the resource is written.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
    valueSetValues: Language.values,
  );

  /// Field definition for [text].
  static const textField = FieldDefinition(
    name: 'text',
    getValue: _getText,
    description: '''
A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human. The narrative need not encode all the structured data, but is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative. Resource definitions may define what content should be represented in the narrative to ensure clinical safety.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [contained].
  static const containedField = FieldDefinition(
    name: 'contained',
    getValue: _getContained,
    description: '''
These resources do not have an independent existence apart from the resource that contains them - they cannot be identified independently, and nor can they have their own independent transaction scope.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [extension].
  static const extensionField = FieldDefinition(
    name: 'extension',
    getValue: _getExtension,
    description: '''
May be used to represent additional information that is not part of the basic definition of the resource. To make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer can define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [modifierExtension].
  static const modifierExtensionField = FieldDefinition(
    name: 'modifierExtension',
    getValue: _getModifierExtension,
    description: '''
May be used to represent additional information that is not part of the basic definition of the resource and that modifies the understanding of the element that contains it and/or the understanding of the containing element's descendants. Usually modifier elements provide negation or qualification. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.

Modifier extensions SHALL NOT change the meaning of any elements on Resource or DomainResource (including cannot change the meaning of modifierExtension itself).''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
    description: '''
This records identifiers associated with this appointment concern that are defined by business processes and/or used to refer to it when a direct URL reference to the resource itself is not appropriate (e.g. in CDA documents, or in written / printed documentation).''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [status].
  static const statusField = FieldDefinition(
    name: 'status',
    getValue: _getStatus,
    description: '''
The overall status of the Appointment. Each of the participants has their own participation status which indicates their involvement in the process, however this status indicates the shared status.''',
    cardinality: Cardinality(
      min: 1,
      max: IntegerChoice(1),
    ),
    valueSetValues: AppointmentStatus.values,
  );

  /// Field definition for [cancelationReason].
  static const cancelationReasonField = FieldDefinition(
    name: 'cancelationReason',
    getValue: _getCancelationReason,
    description: '''
The coded reason for the appointment being cancelled. This is often used in reporting/billing/futher processing to determine if further actions are required, or specific fees apply.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
    valueSetValues: CancelationReason.values,
  );

  /// Field definition for [serviceCategory].
  static const serviceCategoryField = FieldDefinition(
    name: 'serviceCategory',
    getValue: _getServiceCategory,
    description: '''
A broad categorization of the service that is to be performed during this appointment.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
    valueSetValues: ServiceCategory.values,
  );

  /// Field definition for [serviceType].
  static const serviceTypeField = FieldDefinition(
    name: 'serviceType',
    getValue: _getServiceType,
    description: '''
The specific service that is to be performed during this appointment.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
    valueSetValues: ServiceType.values,
  );

  /// Field definition for [specialty].
  static const specialtyField = FieldDefinition(
    name: 'specialty',
    getValue: _getSpecialty,
    description: '''
The specialty of a practitioner that would be required to perform the service requested in this appointment.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [appointmentType].
  static const appointmentTypeField = FieldDefinition(
    name: 'appointmentType',
    getValue: _getAppointmentType,
    description: '''
The style of appointment or patient that has been booked in the slot (not service type).''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
    valueSetValues: AppointmentReason.values,
  );

  /// Field definition for [reasonCode].
  static const reasonCodeField = FieldDefinition(
    name: 'reasonCode',
    getValue: _getReasonCode,
    description: '''
The coded reason that this appointment is being scheduled. This is more clinical than administrative.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [reasonReference].
  static const reasonReferenceField = FieldDefinition(
    name: 'reasonReference',
    getValue: _getReasonReference,
    description: '''
Reason the appointment has been scheduled to take place, as specified using information from another resource. When the patient arrives and the encounter begins it may be used as the admission diagnosis. The indication will typically be a Condition (with other resources referenced in the evidence.detail), or a Procedure.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [priority].
  static const priorityField = FieldDefinition(
    name: 'priority',
    getValue: _getPriority,
    description: '''
The priority of the appointment. Can be used to make informed decisions if needing to re-prioritize appointments. (The iCal Standard specifies 0 as undefined, 1 as highest, 9 as lowest priority).''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [description].
  static const descriptionField = FieldDefinition(
    name: 'description',
    getValue: _getDescription,
    description: '''
The brief description of the appointment as would be shown on a subject line in a meeting request, or appointment list. Detailed or expanded information should be put in the comment field.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [supportingInformation].
  static const supportingInformationField = FieldDefinition(
    name: 'supportingInformation',
    getValue: _getSupportingInformation,
    description: '''
Additional information to support the appointment provided when making the appointment.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [start].
  static const startField = FieldDefinition(
    name: 'start',
    getValue: _getStart,
    description: '''
Date/Time that the appointment is to take place.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [end].
  static const endField = FieldDefinition(
    name: 'end',
    getValue: _getEnd,
    description: '''
Date/Time that the appointment is to conclude.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [minutesDuration].
  static const minutesDurationField = FieldDefinition(
    name: 'minutesDuration',
    getValue: _getMinutesDuration,
    description: '''
Number of minutes that the appointment is to take. This can be less than the duration between the start and end times.  For example, where the actual time of appointment is only an estimate or if a 30 minute appointment is being requested, but any time would work.  Also, if there is, for example, a planned 15 minute break in the middle of a long appointment, the duration may be 15 minutes less than the difference between the start and end.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [slot].
  static const slotField = FieldDefinition(
    name: 'slot',
    getValue: _getSlot,
    description: '''
The slots from the participants' schedules that will be filled by the appointment.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [created].
  static const createdField = FieldDefinition(
    name: 'created',
    getValue: _getCreated,
    description: '''
The date that this appointment was initially created. This could be different to the meta.lastModified value on the initial entry, as this could have been before the resource was created on the FHIR server, and should remain unchanged over the lifespan of the appointment.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [comment].
  static const commentField = FieldDefinition(
    name: 'comment',
    getValue: _getComment,
    description: '''
Additional comments about the appointment.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [patientInstruction].
  static const patientInstructionField = FieldDefinition(
    name: 'patientInstruction',
    getValue: _getPatientInstruction,
    description: '''
While Appointment.comment contains information for internal use, Appointment.patientInstructions is used to capture patient facing information about the Appointment (e.g. please bring your referral or fast from 8pm night before).''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [basedOn].
  static const basedOnField = FieldDefinition(
    name: 'basedOn',
    getValue: _getBasedOn,
    description: '''
The service request this appointment is allocated to assess (e.g. incoming referral or procedure request).''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [participant].
  static const participantField = FieldDefinition(
    name: 'participant',
    getValue: _getParticipant,
    description: '''
List of participants involved in the appointment.''',
    cardinality: Cardinality(min: 1, max: BoolChoice(true)),
  );

  /// Field definition for [requestedPeriod].
  static const requestedPeriodField = FieldDefinition(
    name: 'requestedPeriod',
    getValue: _getRequestedPeriod,
    description: '''
A set of date ranges (potentially including times) that the appointment is preferred to be scheduled within.

The duration (usually in minutes) could also be provided to indicate the length of the appointment to fill and populate the start/end times for the actual allocated time. However, in other situations the duration may be calculated by the scheduling system.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// R4: All field definitions for [Appointment].
  static const fieldDefinitions = [
    ...Element.fieldDefinitions,
    implicitRulesField,
    languageField,
    textField,
    containedField,
    extensionField,
    modifierExtensionField,
    identifierField,
    statusField,
    cancelationReasonField,
    serviceCategoryField,
    serviceTypeField,
    specialtyField,
    appointmentTypeField,
    reasonCodeField,
    reasonReferenceField,
    priorityField,
    descriptionField,
    supportingInformationField,
    startField,
    endField,
    minutesDurationField,
    slotField,
    createdField,
    commentField,
    patientInstructionField,
    basedOnField,
    participantField,
    requestedPeriodField,
  ];

  // Non-destructive mutation

  /// Creates a copy of the [Appointment] instance and allows for non-destructive mutation.
  Appointment copyWith({
    String? id,
    Meta? meta,
    Uri? implicitRules,
    Language? language,
    Narrative? text,
    FixedList<Resource>? contained,
    FixedList<Extension>? extension,
    FixedList<Extension>? modifierExtension,
    FixedList<Identifier>? identifier,
    AppointmentStatus? status,
    CancelationReason? cancelationReason,
    FixedList<ServiceCategory>? serviceCategory,
    FixedList<ServiceType>? serviceType,
    FixedList<CodeableConcept>? specialty,
    AppointmentReason? appointmentType,
    FixedList<CodeableConcept>? reasonCode,
    FixedList<Reference>? reasonReference,
    int? priority,
    String? description,
    FixedList<Reference>? supportingInformation,
    DateTime? start,
    DateTime? end,
    int? minutesDuration,
    FixedList<Reference>? slot,
    DateTime? created,
    String? comment,
    String? patientInstruction,
    FixedList<Reference>? basedOn,
    FixedList<BackboneElement>? participant,
    FixedList<Period>? requestedPeriod,
  }) =>
      Appointment(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        implicitRules: implicitRules ?? this.implicitRules,
        language: language ?? this.language,
        text: text ?? this.text,
        contained: contained ?? this.contained,
        extension: extension ?? this.extension,
        modifierExtension: modifierExtension ?? this.modifierExtension,
        identifier: identifier ?? this.identifier,
        status: status ?? this.status,
        cancelationReason: cancelationReason ?? this.cancelationReason,
        serviceCategory: serviceCategory ?? this.serviceCategory,
        serviceType: serviceType ?? this.serviceType,
        specialty: specialty ?? this.specialty,
        appointmentType: appointmentType ?? this.appointmentType,
        reasonCode: reasonCode ?? this.reasonCode,
        reasonReference: reasonReference ?? this.reasonReference,
        priority: priority ?? this.priority,
        description: description ?? this.description,
        supportingInformation:
            supportingInformation ?? this.supportingInformation,
        start: start ?? this.start,
        end: end ?? this.end,
        minutesDuration: minutesDuration ?? this.minutesDuration,
        slot: slot ?? this.slot,
        created: created ?? this.created,
        comment: comment ?? this.comment,
        patientInstruction: patientInstruction ?? this.patientInstruction,
        basedOn: basedOn ?? this.basedOn,
        participant: participant ?? this.participant,
        requestedPeriod: requestedPeriod ?? this.requestedPeriod,
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
    List<Entry>? entry,
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
  List<Entry>? get entry => entryField.getValue(json);

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
  static const activeField = FieldDefinition(
    name: 'active',
    getValue: _getActive,
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

  /// Field definition for [code].
  static const codeField = FieldDefinition(
    name: 'code',
    getValue: _getCode,
  );

  /// Field definition for [participant].
  static const participantField = FieldDefinition(
    name: 'participant',
    getValue: _getParticipant,
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

  static List<Entry>? _getEntry(JsonObject jo) => switch (jo['entry']) {
        (final JsonArray jsonArray) =>
          jsonArray.value.map((e) => Entry.fromJson(e as JsonObject)).toList(),
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
    List<Entry>? entry,
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
    EncounterStatus? status,
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
            if (status != null) statusField.name: JsonString(status.code),
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
  EncounterStatus? get status => statusField.getValue(json);

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
    ...Element.fieldDefinitions,
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

  static EncounterStatus? _getStatus(JsonObject jo) =>
      switch (jo[statusField.name]) {
        (final JsonString js) => EncounterStatus.fromCode(js.value),
        _ => null,
      };

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
    EncounterStatus? status,
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
            if (id != null) Element.idField.name: JsonString(id),
            if (meta != null) Element.metaField.name: meta.json,
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
    ...Element.fieldDefinitions,
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
    Narrative? text,
    FixedList<Issue>? issue,
  }) : super._internal(
          JsonObject({
            if (id != null) Element.idField.name: JsonString(id),
            if (meta != null) Element.metaField.name: meta.json,
            if (text != null) textField.name: text.json,
            if (issue != null)
              issueField.name: JsonArray.unmodifiable(issue.map((e) => e.json)),
          }),
        );

  /// Creates an [OperationOutcome] instance from the provided JSON object.
  OperationOutcome.fromJson(JsonObject json) : super._internal(json);

  OperationOutcome.error({
    required NarrativeStatus status,
    required String details,
  }) : this(
          text: Narrative(
            status: status,
            div: details,
          ),
        );

  /// A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human.
  Narrative? get text => textField.getValue(json);

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
    ...Element.fieldDefinitions,
    textField,
    issueField,
  ];

  static Narrative? _getText(JsonObject jo) => switch (jo[textField.name]) {
        (final JsonObject jsonObject) => Narrative.fromJson(jsonObject),
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
    Narrative? text,
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
            if (id != null) Element.idField.name: JsonString(id),
            if (meta != null) Element.metaField.name: meta.json,
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
    ...Element.fieldDefinitions,
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
    Uri? implicitRules,
    Language? language,
    Narrative? text,
    FixedList<Resource>? contained,
    FixedList<Extension>? extension,
    FixedList<Extension>? modifierExtension,
    FixedList<Identifier>? identifier,
    bool? active,
    FixedList<HumanName>? name,
    FixedList<ContactPoint>? telecom,
    AdministrativeGender? gender,
    DateTime? birthDate,
    BooleanOrDateTimeChoice? deceased,
    FixedList<Address>? address,
    MaritalStatus? maritalStatus,
    BooleanOrIntegerChoice? multipleBirth,
    FixedList<Attachment>? photo,
    FixedList<BackboneElement>? contact,
    FixedList<BackboneElement>? communication,
    FixedList<Reference>? generalPractitioner,
    Reference? managingOrganization,
    FixedList<BackboneElement>? link,
  }) : super._internal(
          JsonObject({
            if (id != null) idField.name: JsonString(id),
            if (meta != null) metaField.name: meta.json,
            if (implicitRules != null)
              implicitRulesField.name: JsonString(implicitRules.toString()),
            if (language != null) languageField.name: language.json,
            if (text != null) textField.name: text.json,
            if (contained != null)
              containedField.name: JsonArray.unmodifiable(
                contained.map((e) => e.json),
              ),
            if (extension != null)
              extensionField.name: JsonArray.unmodifiable(
                extension.map((e) => e.json),
              ),
            if (modifierExtension != null)
              modifierExtensionField.name: JsonArray.unmodifiable(
                modifierExtension.map((e) => e.json),
              ),
            if (identifier != null)
              identifierField.name: JsonArray.unmodifiable(
                identifier.map((e) => e.json),
              ),
            if (active != null) activeField.name: JsonBoolean(active),
            if (name != null)
              nameField.name: JsonArray.unmodifiable(
                name.map((e) => e.json),
              ),
            if (telecom != null)
              telecomField.name: JsonArray.unmodifiable(
                telecom.map((e) => e.json),
              ),
            if (gender != null) genderField.name: gender.json,
            if (birthDate != null)
              birthDateField.name: JsonString(birthDate.toIso8601String()),
            if (deceased != null) deceasedField.name: deceased.json,
            if (address != null)
              addressField.name: JsonArray.unmodifiable(
                address.map((e) => e.json),
              ),
            if (maritalStatus != null)
              maritalStatusField.name: maritalStatus.json,
            if (multipleBirth != null)
              multipleBirthField.name: multipleBirth.json,
            if (photo != null)
              photoField.name: JsonArray.unmodifiable(
                photo.map((e) => e.json),
              ),
            if (contact != null)
              contactField.name: JsonArray.unmodifiable(
                contact.map((e) => e.json),
              ),
            if (communication != null)
              communicationField.name: JsonArray.unmodifiable(
                communication.map((e) => e.json),
              ),
            if (generalPractitioner != null)
              generalPractitionerField.name: JsonArray.unmodifiable(
                generalPractitioner.map((e) => e.json),
              ),
            if (managingOrganization != null)
              managingOrganizationField.name: managingOrganization.json,
            if (link != null)
              linkField.name: JsonArray.unmodifiable(
                link.map((e) => e.json),
              ),
            _resourceTypeFieldName: const JsonString('Patient'),
          }),
        );

  /// Creates a [Patient] instance from the provided JSON object.
  Patient.fromJson(JsonObject json) : super._internal(json);

  // Getters

  ///A reference to a set of rules that were followed when the resource was cons
  ///tructed, and which must be understood when processing the content. Often, t
  ///his is a reference to an implementation guide that defines the special rule
  ///s along with other profiles etc.
  Uri? get implicitRules => implicitRulesField.getValue(json);

  ///The base language in which the resource is written.
  Language? get language => languageField.getValue(json);

  ///A human-readable narrative that contains a summary of the resource and can
  ///be used to represent the content of the resource to a human. The narrative
  ///need not encode all the structured data, but is required to contain suffici
  ///ent detail to make it "clinically safe" for a human to just read the narrat
  ///ive. Resource definitions may define what content should be represented in
  ///the narrative to ensure clinical safety.
  Narrative? get text => textField.getValue(json);

  ///These resources do not have an independent existence apart from the resourc
  ///e that contains them - they cannot be identified independently, and nor can
  /// they have their own independent transaction scope.
  FixedList<Resource>? get contained => containedField.getValue(json);

  ///May be used to represent additional information that is not part of the bas
  ///ic definition of the resource. To make the use of extensions safe and manag
  ///eable, there is a strict set of governance  applied to the definition and u
  ///se of extensions. Though any implementer can define an extension, there is
  ///a set of requirements that SHALL be met as part of the definition of the ex
  ///tension.
  FixedList<Extension>? get extension => extensionField.getValue(json);

  ///May be used to represent additional information that is not part of the bas
  ///ic definition of the resource and that modifies the understanding of the el
  ///ement that contains it and/or the understanding of the containing element's
  /// descendants. Usually modifier elements provide negation or qualification.
  ///To make the use of extensions safe and manageable, there is a strict set of
  /// governance applied to the definition and use of extensions. Though any imp
  ///lementer is allowed to define an extension, there is a set of requirements
  ///that SHALL be met as part of the definition of the extension. Applications
  ///processing a resource are required to check for modifier extensions.Modifie
  ///r extensions SHALL NOT change the meaning of any elements on Resource or Do
  ///mainResource (including cannot change the meaning of modifierExtension itse
  ///lf).
  FixedList<Extension>? get modifierExtension =>
      modifierExtensionField.getValue(json);

  ///An identifier for this patient.
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  ///Whether this patient record is in active use. Many systems use this propert
  ///y to mark as non-current patients, such as those that have not been seen fo
  ///r a period of time based on an organization's business rules.It is often us
  ///ed to filter patient lists to exclude inactive patientsDeceased patients ma
  ///y also be marked as inactive for the same reasons, but may be active for so
  ///me time after death.
  bool? get active => activeField.getValue(json);

  ///A name associated with the individual.
  FixedList<HumanName>? get name => nameField.getValue(json);

  ///A contact detail (e.g. a telephone number or an email address) by which the
  /// individual may be contacted.
  FixedList<ContactPoint>? get telecom => telecomField.getValue(json);

  ///Administrative Gender - the gender that the patient is considered to have f
  ///or administration and record keeping purposes.
  AdministrativeGender? get gender => genderField.getValue(json);

  ///The date of birth for the individual.
  DateTime? get birthDate => birthDateField.getValue(json);

  ///Indicates if the individual is deceased or not.
  BooleanOrDateTimeChoice? get deceased => deceasedField.getValue(json);

  ///An address for the individual.
  FixedList<Address>? get address => addressField.getValue(json);

  ///This field contains a patient's most recent marital (civil) status.
  MaritalStatus? get maritalStatus => maritalStatusField.getValue(json);

  ///Indicates whether the patient is part of a multiple (boolean) or indicates
  ///the actual birth order (integer).
  BooleanOrIntegerChoice? get multipleBirth =>
      multipleBirthField.getValue(json);

  ///Image of the patient.
  FixedList<Attachment>? get photo => photoField.getValue(json);

  ///A contact party (e.g. guardian, partner, friend) for the patient.
  FixedList<BackboneElement>? get contact => contactField.getValue(json);

  ///A language which may be used to communicate with the patient about his or h
  ///er health.
  FixedList<BackboneElement>? get communication =>
      communicationField.getValue(json);

  ///Patient's nominated care provider.
  FixedList<Reference>? get generalPractitioner =>
      generalPractitionerField.getValue(json);

  ///Organization that is the custodian of the patient record.
  Reference? get managingOrganization =>
      managingOrganizationField.getValue(json);

  ///Link to another patient resource that concerns the same actual patient.
  FixedList<BackboneElement>? get link => linkField.getValue(json);

  // Static Get Methods

  static String? _getId(JsonObject jo) => jo[idField.name].stringValue;

  static Meta? _getMeta(JsonObject jo) => switch (jo[metaField.name]) {
        (final JsonObject jsonObject) => Meta.fromJson(jsonObject),
        _ => null,
      };

  static Uri? _getImplicitRules(JsonObject jo) =>
      jo[implicitRulesField.name].uriValue;

  static Language? _getLanguage(JsonObject jo) =>
      switch (jo[languageField.name]) {
        (final JsonString js) => Language.fromCode(js.value),
        _ => null,
      };

  static Narrative? _getText(JsonObject jo) => switch (jo[textField.name]) {
        (final JsonObject jsonObject) => Narrative.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<Resource>? _getContained(JsonObject jo) =>
      switch (jo[containedField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Resource.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Extension>? _getExtension(JsonObject jo) =>
      switch (jo[extensionField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Extension.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Extension>? _getModifierExtension(JsonObject jo) =>
      switch (jo[modifierExtensionField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Extension.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo[identifierField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static bool? _getActive(JsonObject jo) => jo[activeField.name].booleanValue;

  static FixedList<HumanName>? _getName(JsonObject jo) =>
      switch (jo[nameField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => HumanName.fromJson(e as JsonObject)),
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
        (final JsonString js) => AdministrativeGender.fromCode(js.value),
        _ => null,
      };

  static DateTime? _getBirthDate(JsonObject jo) =>
      DateTime.tryParse(jo[birthDateField.name].stringValue ?? '');

  static BooleanOrDateTimeChoice? _getDeceased(JsonObject jo) =>
      BooleanOrDateTimeChoice.fromJson(jo[deceasedField.name]);

  static FixedList<Address>? _getAddress(JsonObject jo) =>
      switch (jo[addressField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Address.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static MaritalStatus? _getMaritalStatus(JsonObject jo) =>
      switch (jo[maritalStatusField.name]) {
        (final JsonString js) => MaritalStatus.fromCode(js.value),
        _ => null,
      };

  static BooleanOrIntegerChoice? _getMultipleBirth(JsonObject jo) =>
      BooleanOrIntegerChoice.fromJson(jo[multipleBirthField.name]);

  static FixedList<Attachment>? _getPhoto(JsonObject jo) =>
      switch (jo[photoField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Attachment.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<BackboneElement>? _getContact(JsonObject jo) =>
      switch (jo[contactField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => BackboneElement.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<BackboneElement>? _getCommunication(JsonObject jo) =>
      switch (jo[communicationField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => BackboneElement.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Reference>? _getGeneralPractitioner(JsonObject jo) =>
      switch (jo[generalPractitionerField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static Reference? _getManagingOrganization(JsonObject jo) =>
      switch (jo[managingOrganizationField.name]) {
        (final JsonObject jsonObject) => Reference.fromJson(jsonObject),
        _ => null,
      };

  static FixedList<BackboneElement>? _getLink(JsonObject jo) =>
      switch (jo[linkField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => BackboneElement.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  // Field Definitions

  /// Field definition for [id].
  static const idField = FieldDefinition(
    name: 'id',
    getValue: _getId,
    description: '''
The logical id of the resource, as used in the URL for the resource. Once assigned, this value never changes.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [meta].
  static const metaField = FieldDefinition(
    name: 'meta',
    getValue: _getMeta,
    description: '''
The metadata about the resource. This is content that is maintained by the infrastructure. Changes to the content might not always be associated with version changes to the resource.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [implicitRules].
  static const implicitRulesField = FieldDefinition(
    name: 'implicitRules',
    getValue: _getImplicitRules,
    description: '''
A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [language].
  static const languageField = FieldDefinition(
    name: 'language',
    getValue: _getLanguage,
    description: '''
The base language in which the resource is written.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
    valueSetValues: Language.values,
  );

  /// Field definition for [text].
  static const textField = FieldDefinition(
    name: 'text',
    getValue: _getText,
    description: '''
A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human. The narrative need not encode all the structured data, but is required to contain sufficient detail to make it "clinically safe" for a human to just read the narrative. Resource definitions may define what content should be represented in the narrative to ensure clinical safety.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [contained].
  static const containedField = FieldDefinition(
    name: 'contained',
    getValue: _getContained,
    description: '''
These resources do not have an independent existence apart from the resource that contains them - they cannot be identified independently, and nor can they have their own independent transaction scope.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [extension].
  static const extensionField = FieldDefinition(
    name: 'extension',
    getValue: _getExtension,
    description: '''
May be used to represent additional information that is not part of the basic definition of the resource. To make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer can define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [modifierExtension].
  static const modifierExtensionField = FieldDefinition(
    name: 'modifierExtension',
    getValue: _getModifierExtension,
    description: '''
May be used to represent additional information that is not part of the basic definition of the resource and that modifies the understanding of the element that contains it and/or the understanding of the containing element's descendants. Usually modifier elements provide negation or qualification. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.

Modifier extensions SHALL NOT change the meaning of any elements on Resource or DomainResource (including cannot change the meaning of modifierExtension itself).''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [identifier].
  static const identifierField = FieldDefinition(
    name: 'identifier',
    getValue: _getIdentifier,
    description: '''
An identifier for this patient.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [active].
  static const activeField = FieldDefinition(
    name: 'active',
    getValue: _getActive,
    description: '''
Whether this patient record is in active use. 
Many systems use this property to mark as non-current patients, such as those that have not been seen for a period of time based on an organization's business rules.

It is often used to filter patient lists to exclude inactive patients

Deceased patients may also be marked as inactive for the same reasons, but may be active for some time after death.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [name].
  static const nameField = FieldDefinition(
    name: 'name',
    getValue: _getName,
    description: '''
A name associated with the individual.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [telecom].
  static const telecomField = FieldDefinition(
    name: 'telecom',
    getValue: _getTelecom,
    description: '''
A contact detail (e.g. a telephone number or an email address) by which the individual may be contacted.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [gender].
  static const genderField = FieldDefinition(
    name: 'gender',
    getValue: _getGender,
    description: '''
Administrative Gender - the gender that the patient is considered to have for administration and record keeping purposes.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
    valueSetValues: AdministrativeGender.values,
  );

  /// Field definition for [birthDate].
  static const birthDateField = FieldDefinition(
    name: 'birthDate',
    getValue: _getBirthDate,
    description: '''
The date of birth for the individual.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [deceased].
  static const deceasedField = FieldDefinition(
    name: 'deceased',
    getValue: _getDeceased,
    description: '''
Indicates if the individual is deceased or not.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [address].
  static const addressField = FieldDefinition(
    name: 'address',
    getValue: _getAddress,
    description: '''
An address for the individual.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [maritalStatus].
  static const maritalStatusField = FieldDefinition(
    name: 'maritalStatus',
    getValue: _getMaritalStatus,
    description: '''
This field contains a patient's most recent marital (civil) status.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
    valueSetValues: MaritalStatus.values,
  );

  /// Field definition for [multipleBirth].
  static const multipleBirthField = FieldDefinition(
    name: 'multipleBirth',
    getValue: _getMultipleBirth,
    description: '''
Indicates whether the patient is part of a multiple (boolean) or indicates the actual birth order (integer).''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [photo].
  static const photoField = FieldDefinition(
    name: 'photo',
    getValue: _getPhoto,
    description: '''
Image of the patient.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [contact].
  static const contactField = FieldDefinition(
    name: 'contact',
    getValue: _getContact,
    description: '''
A contact party (e.g. guardian, partner, friend) for the patient.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [communication].
  static const communicationField = FieldDefinition(
    name: 'communication',
    getValue: _getCommunication,
    description: '''
A language which may be used to communicate with the patient about his or her health.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [generalPractitioner].
  static const generalPractitionerField = FieldDefinition(
    name: 'generalPractitioner',
    getValue: _getGeneralPractitioner,
    description: '''
Patient's nominated care provider.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// Field definition for [managingOrganization].
  static const managingOrganizationField = FieldDefinition(
    name: 'managingOrganization',
    getValue: _getManagingOrganization,
    description: '''
Organization that is the custodian of the patient record.''',
    cardinality: Cardinality(
      min: 0,
      max: IntegerChoice(1),
    ),
  );

  /// Field definition for [link].
  static const linkField = FieldDefinition(
    name: 'link',
    getValue: _getLink,
    description: '''
Link to another patient resource that concerns the same actual patient.''',
    cardinality: Cardinality(min: 0, max: BoolChoice(true)),
  );

  /// R4: All field definitions for [Patient].
  static const fieldDefinitions = [
    ...Element.fieldDefinitions,
    implicitRulesField,
    languageField,
    textField,
    containedField,
    extensionField,
    modifierExtensionField,
    identifierField,
    activeField,
    nameField,
    telecomField,
    genderField,
    birthDateField,
    deceasedField,
    addressField,
    maritalStatusField,
    multipleBirthField,
    photoField,
    contactField,
    communicationField,
    generalPractitionerField,
    managingOrganizationField,
    linkField,
  ];

  // Non-destructive mutation

  /// Creates a copy of the [Patient] instance and allows for non-destructive mutation.
  Patient copyWith({
    String? id,
    Meta? meta,
    Uri? implicitRules,
    Language? language,
    Narrative? text,
    FixedList<Resource>? contained,
    FixedList<Extension>? extension,
    FixedList<Extension>? modifierExtension,
    FixedList<Identifier>? identifier,
    bool? active,
    FixedList<HumanName>? name,
    FixedList<ContactPoint>? telecom,
    AdministrativeGender? gender,
    DateTime? birthDate,
    BooleanOrDateTimeChoice? deceased,
    FixedList<Address>? address,
    MaritalStatus? maritalStatus,
    BooleanOrIntegerChoice? multipleBirth,
    FixedList<Attachment>? photo,
    FixedList<BackboneElement>? contact,
    FixedList<BackboneElement>? communication,
    FixedList<Reference>? generalPractitioner,
    Reference? managingOrganization,
    FixedList<BackboneElement>? link,
  }) =>
      Patient(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        implicitRules: implicitRules ?? this.implicitRules,
        language: language ?? this.language,
        text: text ?? this.text,
        contained: contained ?? this.contained,
        extension: extension ?? this.extension,
        modifierExtension: modifierExtension ?? this.modifierExtension,
        identifier: identifier ?? this.identifier,
        active: active ?? this.active,
        name: name ?? this.name,
        telecom: telecom ?? this.telecom,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        deceased: deceased ?? this.deceased,
        address: address ?? this.address,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        multipleBirth: multipleBirth ?? this.multipleBirth,
        photo: photo ?? this.photo,
        contact: contact ?? this.contact,
        communication: communication ?? this.communication,
        generalPractitioner: generalPractitioner ?? this.generalPractitioner,
        managingOrganization: managingOrganization ?? this.managingOrganization,
        link: link ?? this.link,
      );
}

/// A person who is directly or indirectly involved in the provisioning of healthcare.
class Practitioner extends Resource {
  /// Constructs a new [Practitioner].
  Practitioner({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    bool? active,
    FixedList<HumanName>? name,
    FixedList<ContactPoint>? telecom,
    FixedList<Address>? address,
    AdministrativeGender? gender,
    DateTime? birthDate,
    List<Attachment>? photo,
    List<CodeableConcept>? qualification,
    List<CodeableConcept>? communication,
  }) : super._internal(
          JsonObject({
            if (id != null) Element.idField.name: JsonString(id),
            if (meta != null) Element.metaField.name: meta.json,
            if (identifier != null)
              identifierField.name:
                  JsonArray.unmodifiable(identifier.map((e) => e.json)),
            if (active != null) activeField.name: JsonBoolean(active),
            if (name != null)
              nameField.name: JsonArray.unmodifiable(name.map((e) => e.json)),
            if (telecom != null)
              telecomField.name:
                  JsonArray.unmodifiable(telecom.map((e) => e.json)),
            if (address != null)
              addressField.name:
                  JsonArray.unmodifiable(address.map((e) => e.json)),
            if (gender != null) genderField.name: JsonString(gender.code),
            if (birthDate != null)
              birthDateField.name: JsonString(birthDate.toIso8601String()),
            if (photo != null)
              photoField.name: JsonArray.unmodifiable(photo.map((e) => e.json)),
            if (qualification != null)
              qualificationField.name:
                  JsonArray.unmodifiable(qualification.map((e) => e.json)),
            if (communication != null)
              communicationField.name:
                  JsonArray.unmodifiable(communication.map((e) => e.json)),
          }),
        );

  /// Creates a [Practitioner] instance from the provided JSON object.
  Practitioner.fromJson(JsonObject json) : super._internal(json);

  /// An identifier that applies to this person in this role.
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  /// Whether this practitioner's record is in active use.
  bool? get active => activeField.getValue(json);

  /// The name(s) associated with the practitioner.
  FixedList<HumanName>? get name => nameField.getValue(json);

  /// A contact detail for the practitioner, e.g. a telephone number or an email address.
  FixedList<ContactPoint>? get telecom => telecomField.getValue(json);

  /// Address(es) of the practitioner that are not role specific (typically home address).
  FixedList<Address>? get address => addressField.getValue(json);

  /// Administrative Gender - the gender that the practitioner is considered to have for administration and record keeping purposes.
  AdministrativeGender? get gender => genderField.getValue(json);

  /// The date of birth for the practitioner.
  DateTime? get birthDate => birthDateField.getValue(json);

  /// Image of the practitioner.
  List<Attachment>? get photo => photoField.getValue(json);

  /// Qualifications obtained by the practitioner.
  List<CodeableConcept>? get qualification => qualificationField.getValue(json);

  /// A language the practitioner is able to use in patient communication.
  List<CodeableConcept>? get communication => communicationField.getValue(json);

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

  /// Field definition for [birthDate].
  static const birthDateField = FieldDefinition(
    name: 'birthDate',
    getValue: _getBirthDate,
  );

  /// Field definition for [photo].
  static const photoField = FieldDefinition(
    name: 'photo',
    getValue: _getPhoto,
  );

  /// Field definition for [qualification].
  static const qualificationField = FieldDefinition(
    name: 'qualification',
    getValue: _getQualification,
  );

  /// Field definition for [communication].
  static const communicationField = FieldDefinition(
    name: 'communication',
    getValue: _getCommunication,
  );

  /// All field definitions for [Practitioner].
  static const fieldDefinitions = [
    ...Element.fieldDefinitions,
    identifierField,
    activeField,
    nameField,
    telecomField,
    addressField,
    genderField,
    birthDateField,
    photoField,
    qualificationField,
    communicationField,
  ];

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo[identifierField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static bool? _getActive(JsonObject jo) => jo[activeField.name].booleanValue;

  static FixedList<HumanName>? _getName(JsonObject jo) =>
      switch (jo[nameField.name]) {
        (final JsonArray jsonArray)
            when jsonArray.value.every((jv) => jv is JsonObject) =>
          FixedList(
            //TODO: bad casting here
            jsonArray.value.map((jv) => HumanName.fromJson(jv as JsonObject)),
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

  static FixedList<Address>? _getAddress(JsonObject jo) =>
      switch (jo[addressField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Address.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static AdministrativeGender? _getGender(JsonObject jo) =>
      switch (jo[genderField.name]) {
        (final JsonString jsonString) =>
          AdministrativeGender.fromCode(jsonString.value),
        _ => null,
      };

  static DateTime? _getBirthDate(JsonObject jo) =>
      switch (jo[birthDateField.name]) {
        (final JsonString jsonString) => DateTime.parse(jsonString.value),
        _ => null,
      };

  static List<Attachment>? _getPhoto(JsonObject jo) =>
      switch (jo[photoField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => Attachment.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<CodeableConcept>? _getQualification(JsonObject jo) =>
      switch (jo[qualificationField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => CodeableConcept.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<CodeableConcept>? _getCommunication(JsonObject jo) =>
      switch (jo[communicationField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => CodeableConcept.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  /// Creates a copy of the [Practitioner] instance and allows for non-destructive mutation.
  Practitioner copyWith({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    bool? active,
    FixedList<HumanName>? name,
    FixedList<ContactPoint>? telecom,
    FixedList<Address>? address,
    AdministrativeGender? gender,
    DateTime? birthDate,
    List<Attachment>? photo,
    List<CodeableConcept>? qualification,
    List<CodeableConcept>? communication,
  }) =>
      Practitioner(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        active: active ?? this.active,
        name: name ?? this.name,
        telecom: telecom ?? this.telecom,
        address: address ?? this.address,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        photo: photo ?? this.photo,
        qualification: qualification ?? this.qualification,
        communication: communication ?? this.communication,
      );
}

/// A specific set of Roles/Locations/specialties/services that a practitioner may perform at an organization for a period of time.
class PractitionerRole extends Resource {
  /// Constructs a new [PractitionerRole].
  PractitionerRole({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    bool? active,
    Period? period,
    Reference? practitioner,
    Reference? organization,
    List<CodeableConcept>? code,
    List<CodeableConcept>? specialty,
    List<Reference>? location,
    List<Reference>? healthcareService,
    List<ContactPoint>? telecom,
    List<AvailableTime>? availableTime,
    List<NotAvailable>? notAvailable,
    String? availabilityExceptions,
    List<Reference>? endpoint,
  }) : super._internal(
          JsonObject({
            if (id != null) Element.idField.name: JsonString(id),
            if (meta != null) Element.metaField.name: meta.json,
            if (identifier != null)
              identifierField.name:
                  JsonArray.unmodifiable(identifier.map((e) => e.json)),
            if (active != null) activeField.name: JsonBoolean(active),
            if (period != null) periodField.name: period.json,
            if (practitioner != null) practitionerField.name: practitioner.json,
            if (organization != null) organizationField.name: organization.json,
            if (code != null)
              codeField.name: JsonArray.unmodifiable(code.map((e) => e.json)),
            if (specialty != null)
              specialtyField.name:
                  JsonArray.unmodifiable(specialty.map((e) => e.json)),
            if (location != null)
              locationField.name:
                  JsonArray.unmodifiable(location.map((e) => e.json)),
            if (healthcareService != null)
              healthcareServiceField.name:
                  JsonArray.unmodifiable(healthcareService.map((e) => e.json)),
            if (telecom != null)
              telecomField.name:
                  JsonArray.unmodifiable(telecom.map((e) => e.json)),
            if (availableTime != null)
              availableTimeField.name:
                  JsonArray.unmodifiable(availableTime.map((e) => e.json)),
            if (notAvailable != null)
              notAvailableField.name:
                  JsonArray.unmodifiable(notAvailable.map((e) => e.json)),
            if (availabilityExceptions != null)
              availabilityExceptionsField.name:
                  JsonString(availabilityExceptions),
            if (endpoint != null)
              endpointField.name:
                  JsonArray.unmodifiable(endpoint.map((e) => e.json)),
          }),
        );

  /// Creates a [PractitionerRole] instance from the provided JSON object.
  PractitionerRole.fromJson(JsonObject json) : super._internal(json);

  /// Business Identifiers that are specific to a role/location.
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  /// Whether this practitioner role record is in active use.
  bool? get active => activeField.getValue(json);

  /// The period during which the practitioner is authorized to perform in these role(s).
  Period? get period => periodField.getValue(json);

  /// Practitioner that is able to provide the defined services for the organization.
  Reference? get practitioner => practitionerField.getValue(json);

  /// The organization where the Practitioner performs the roles associated.
  Reference? get organization => organizationField.getValue(json);

  /// Roles which this practitioner is authorized to perform for the organization.
  List<CodeableConcept>? get code => codeField.getValue(json);

  /// Specific specialty of the practitioner.
  List<CodeableConcept>? get specialty => specialtyField.getValue(json);

  /// The location(s) at which this practitioner provides care.
  List<Reference>? get location => locationField.getValue(json);

  /// The list of healthcare services that this worker provides for this role's Organization/Location(s).
  List<Reference>? get healthcareService =>
      healthcareServiceField.getValue(json);

  /// Contact details that are specific to the role/location/service.
  List<ContactPoint>? get telecom => telecomField.getValue(json);

  /// A collection of times the practitioner is available or performing this role at the location and/or healthcareservice.
  List<AvailableTime>? get availableTime => availableTimeField.getValue(json);

  /// The practitioner is not available or performing this role during this period of time due to the provided reason.
  List<NotAvailable>? get notAvailable => notAvailableField.getValue(json);

  /// A description of site availability exceptions, e.g. public holiday availability. Succinctly describing all possible exceptions to normal site availability as details in the available Times and not available Times.
  String? get availabilityExceptions =>
      availabilityExceptionsField.getValue(json);

  /// Technical endpoints providing access to services operated for the practitioner with this role.
  List<Reference>? get endpoint => endpointField.getValue(json);

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

  /// Field definition for [organization].
  static const organizationField = FieldDefinition(
    name: 'organization',
    getValue: _getOrganization,
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

  /// Field definition for [healthcareService].
  static const healthcareServiceField = FieldDefinition(
    name: 'healthcareService',
    getValue: _getHealthcareService,
  );

  /// Field definition for [telecom].
  static const telecomField = FieldDefinition(
    name: 'telecom',
    getValue: _getTelecom,
  );

  /// Field definition for [availableTime].
  static const availableTimeField = FieldDefinition(
    name: 'availableTime',
    getValue: _getAvailableTime,
  );

  /// Field definition for [notAvailable].
  static const notAvailableField = FieldDefinition(
    name: 'notAvailable',
    getValue: _getNotAvailable,
  );

  /// Field definition for [availabilityExceptions].
  static const availabilityExceptionsField = FieldDefinition(
    name: 'availabilityExceptions',
    getValue: _getAvailabilityExceptions,
  );

  /// Field definition for [endpoint].
  static const endpointField = FieldDefinition(
    name: 'endpoint',
    getValue: _getEndpoint,
  );

  /// All field definitions for [PractitionerRole].
  static const fieldDefinitions = [
    ...Element.fieldDefinitions,
    identifierField,
    activeField,
    periodField,
    practitionerField,
    organizationField,
    codeField,
    specialtyField,
    locationField,
    healthcareServiceField,
    telecomField,
    availableTimeField,
    notAvailableField,
    availabilityExceptionsField,
    endpointField,
  ];

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo[identifierField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static bool? _getActive(JsonObject jo) => jo[activeField.name].booleanValue;

  static Period? _getPeriod(JsonObject jo) => switch (jo[periodField.name]) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  static Reference? _getPractitioner(JsonObject jo) =>
      switch (jo[practitionerField.name]) {
        (final JsonObject jsonObject) => Reference.fromJson(jsonObject),
        _ => null,
      };

  static Reference? _getOrganization(JsonObject jo) =>
      switch (jo[organizationField.name]) {
        (final JsonObject jsonObject) => Reference.fromJson(jsonObject),
        _ => null,
      };

  static List<CodeableConcept>? _getCode(JsonObject jo) =>
      switch (jo[codeField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => CodeableConcept.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<CodeableConcept>? _getSpecialty(JsonObject jo) =>
      switch (jo[specialtyField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => CodeableConcept.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<Reference>? _getLocation(JsonObject jo) =>
      switch (jo[locationField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => Reference.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<Reference>? _getHealthcareService(JsonObject jo) =>
      switch (jo[healthcareServiceField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => Reference.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<ContactPoint>? _getTelecom(JsonObject jo) =>
      switch (jo[telecomField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => ContactPoint.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<AvailableTime>? _getAvailableTime(JsonObject jo) =>
      switch (jo[availableTimeField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => AvailableTime.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<NotAvailable>? _getNotAvailable(JsonObject jo) =>
      switch (jo[notAvailableField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => NotAvailable.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static String? _getAvailabilityExceptions(JsonObject jo) =>
      jo[availabilityExceptionsField.name].stringValue;

  static List<Reference>? _getEndpoint(JsonObject jo) =>
      switch (jo[endpointField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => Reference.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  /// Creates a copy of the [PractitionerRole] instance and allows for non-destructive mutation.
  PractitionerRole copyWith({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    bool? active,
    Period? period,
    Reference? practitioner,
    Reference? organization,
    List<CodeableConcept>? code,
    List<CodeableConcept>? specialty,
    List<Reference>? location,
    List<Reference>? healthcareService,
    List<ContactPoint>? telecom,
    List<AvailableTime>? availableTime,
    List<NotAvailable>? notAvailable,
    String? availabilityExceptions,
    List<Reference>? endpoint,
  }) =>
      PractitionerRole(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        active: active ?? this.active,
        period: period ?? this.period,
        practitioner: practitioner ?? this.practitioner,
        organization: organization ?? this.organization,
        code: code ?? this.code,
        specialty: specialty ?? this.specialty,
        location: location ?? this.location,
        healthcareService: healthcareService ?? this.healthcareService,
        telecom: telecom ?? this.telecom,
        availableTime: availableTime ?? this.availableTime,
        notAvailable: notAvailable ?? this.notAvailable,
        availabilityExceptions:
            availabilityExceptions ?? this.availabilityExceptions,
        endpoint: endpoint ?? this.endpoint,
      );
}

/// A slot of time on a schedule that may be available for booking appointments.
class Slot extends Resource {
  /// Constructs a new [Slot].
  Slot({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    List<CodeableConcept>? serviceCategory,
    List<CodeableConcept>? serviceType,
    List<CodeableConcept>? specialty,
    CodeableConcept? appointmentType,
    String? schedule,
    SlotStatus? status,
    DateTime? start,
    DateTime? end,
    bool? overbooked,
    String? comment,
  }) : super._internal(
          JsonObject({
            if (id != null) Element.idField.name: JsonString(id),
            if (meta != null) Element.metaField.name: meta.json,
            if (identifier != null)
              identifierField.name:
                  JsonArray.unmodifiable(identifier.map((e) => e.json)),
            if (serviceCategory != null)
              serviceCategoryField.name:
                  JsonArray.unmodifiable(serviceCategory.map((e) => e.json)),
            if (serviceType != null)
              serviceTypeField.name:
                  JsonArray.unmodifiable(serviceType.map((e) => e.json)),
            if (specialty != null)
              specialtyField.name:
                  JsonArray.unmodifiable(specialty.map((e) => e.json)),
            if (appointmentType != null)
              appointmentTypeField.name: appointmentType.json,
            if (schedule != null) scheduleField.name: JsonString(schedule),
            if (status != null) statusField.name: JsonString(status.code),
            if (start != null)
              startField.name: JsonString(start.toIso8601String()),
            if (end != null) endField.name: JsonString(end.toIso8601String()),
            if (overbooked != null)
              overbookedField.name: JsonBoolean(overbooked),
            if (comment != null) commentField.name: JsonString(comment),
          }),
        );

  /// Creates a [Slot] instance from the provided JSON object.
  Slot.fromJson(JsonObject json) : super._internal(json);

  /// External Ids for this item.
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  /// A broad categorization of the service that is to be performed during this appointment.
  List<CodeableConcept>? get serviceCategory =>
      serviceCategoryField.getValue(json);

  /// The type of appointments that can be booked into this slot (ideally this would be an identifiable service - which is at a location, rather than the location itself). If provided then this overrides the value provided on the availability resource.
  List<CodeableConcept>? get serviceType => serviceTypeField.getValue(json);

  /// The specialty of a practitioner that would be required to perform the service requested in this appointment.
  List<CodeableConcept>? get specialty => specialtyField.getValue(json);

  /// The style of appointment or patient that may be booked in the slot (not service type).
  CodeableConcept? get appointmentType => appointmentTypeField.getValue(json);

  /// The schedule resource that this slot defines an interval of status information.
  String? get schedule => scheduleField.getValue(json);

  /// The status of the slot.
  SlotStatus? get status => statusField.getValue(json);

  /// Date/Time that the slot is to begin.
  DateTime? get start => startField.getValue(json);

  /// Date/Time that the slot is to conclude.
  DateTime? get end => endField.getValue(json);

  /// This slot has already been overbooked, appointments are unlikely to be accepted for this time.
  bool? get overbooked => overbookedField.getValue(json);

  /// Comments on the slot to describe any extended information. Such as custom constraints on the slot.
  String? get comment => commentField.getValue(json);

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

  /// Field definition for [schedule].
  static const scheduleField = FieldDefinition(
    name: 'schedule',
    getValue: _getSchedule,
  );

  /// Field definition for [status].
  static const statusField = FieldDefinition(
    name: 'status',
    getValue: _getStatus,
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

  /// Field definition for [overbooked].
  static const overbookedField = FieldDefinition(
    name: 'overbooked',
    getValue: _getOverbooked,
  );

  /// Field definition for [comment].
  static const commentField = FieldDefinition(
    name: 'comment',
    getValue: _getComment,
  );

  /// All field definitions for [Slot].
  static const fieldDefinitions = [
    ...Element.fieldDefinitions,
    identifierField,
    serviceCategoryField,
    serviceTypeField,
    specialtyField,
    appointmentTypeField,
    scheduleField,
    statusField,
    startField,
    endField,
    overbookedField,
    commentField,
  ];

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo[identifierField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static List<CodeableConcept>? _getServiceCategory(JsonObject jo) =>
      switch (jo[serviceCategoryField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => CodeableConcept.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<CodeableConcept>? _getServiceType(JsonObject jo) =>
      switch (jo[serviceTypeField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => CodeableConcept.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static List<CodeableConcept>? _getSpecialty(JsonObject jo) =>
      switch (jo[specialtyField.name]) {
        (final JsonArray jsonArray) => jsonArray.value
            .map((e) => CodeableConcept.fromJson(e as JsonObject))
            .toList(),
        _ => null,
      };

  static CodeableConcept? _getAppointmentType(JsonObject jo) =>
      switch (jo[appointmentTypeField.name]) {
        (final JsonObject jsonObject) => CodeableConcept.fromJson(jsonObject),
        _ => null,
      };

  static String? _getSchedule(JsonObject jo) =>
      jo[scheduleField.name].stringValue;

  static SlotStatus? _getStatus(JsonObject jo) =>
      switch (jo[statusField.name]) {
        (final JsonString js) => SlotStatus.fromCode(js.value),
        _ => null,
      };

  static DateTime? _getStart(JsonObject jo) => DateTime.tryParse(
        jo[startField.name].stringValue ?? '',
      );

  static DateTime? _getEnd(JsonObject jo) => DateTime.tryParse(
        jo[endField.name].stringValue ?? '',
      );

  static bool? _getOverbooked(JsonObject jo) =>
      jo[overbookedField.name].booleanValue;

  static String? _getComment(JsonObject jo) =>
      jo[commentField.name].stringValue;

  /// Creates a copy of the [Slot] instance and allows for non-destructive mutation.
  Slot copyWith({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    List<CodeableConcept>? serviceCategory,
    List<CodeableConcept>? serviceType,
    List<CodeableConcept>? specialty,
    CodeableConcept? appointmentType,
    String? schedule,
    SlotStatus? status,
    DateTime? start,
    DateTime? end,
    bool? overbooked,
    String? comment,
  }) =>
      Slot(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        serviceCategory: serviceCategory ?? this.serviceCategory,
        serviceType: serviceType ?? this.serviceType,
        specialty: specialty ?? this.specialty,
        appointmentType: appointmentType ?? this.appointmentType,
        schedule: schedule ?? this.schedule,
        status: status ?? this.status,
        start: start ?? this.start,
        end: end ?? this.end,
        overbooked: overbooked ?? this.overbooked,
        comment: comment ?? this.comment,
      );
}

/// A schedule of appointments.
class Schedule extends Resource {
  /// Constructs a new [Schedule].
  Schedule({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    bool? active,
    FixedList<CodeableConcept>? serviceCategory,
    FixedList<CodeableConcept>? serviceType,
    FixedList<CodeableConcept>? specialty,
    FixedList<Reference>? actor,
    Period? planningHorizon,
    String? comment,
  }) : super._internal(
          JsonObject({
            if (id != null) Element.idField.name: JsonString(id),
            if (meta != null) Element.metaField.name: meta.json,
            if (identifier != null)
              identifierField.name:
                  JsonArray.unmodifiable(identifier.map((e) => e.json)),
            if (active != null) activeField.name: JsonBoolean(active),
            if (serviceCategory != null)
              serviceCategoryField.name:
                  JsonArray.unmodifiable(serviceCategory.map((e) => e.json)),
            if (serviceType != null)
              serviceTypeField.name:
                  JsonArray.unmodifiable(serviceType.map((e) => e.json)),
            if (specialty != null)
              specialtyField.name:
                  JsonArray.unmodifiable(specialty.map((e) => e.json)),
            if (actor != null)
              actorField.name: JsonArray.unmodifiable(actor.map((e) => e.json)),
            if (planningHorizon != null)
              planningHorizonField.name: planningHorizon.json,
            if (comment != null) commentField.name: JsonString(comment),
          }),
        );

  /// Creates a [Schedule] instance from the provided JSON object.
  Schedule.fromJson(JsonObject json) : super._internal(json);

  /// External Ids for this item.
  FixedList<Identifier>? get identifier => identifierField.getValue(json);

  /// Whether this schedule is currently active or not.
  bool? get active => activeField.getValue(json);

  /// A broad categorization of the service that is to be performed during this schedule.
  FixedList<CodeableConcept>? get serviceCategory =>
      serviceCategoryField.getValue(json);

  /// The type of appointments that can be booked into this schedule (ideally this would be an identifiable service - which is at a location, rather than the location itself).
  FixedList<CodeableConcept>? get serviceType =>
      serviceTypeField.getValue(json);

  /// The specialty of a practitioner that would be required to perform the services requested in this schedule.
  FixedList<CodeableConcept>? get specialty => specialtyField.getValue(json);

  /// The actors that are available to perform services in this schedule.
  FixedList<Reference>? get actor => actorField.getValue(json);

  /// The period of time that the schedule refers to.
  Period? get planningHorizon => planningHorizonField.getValue(json);

  /// Comments on the schedule to describe any extended information. Such as custom constraints on the schedule.
  String? get comment => commentField.getValue(json);

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
  static const commentField = FieldDefinition(
    name: 'comment',
    getValue: _getComment,
  );

  /// All field definitions for [Schedule].
  static const fieldDefinitions = [
    ...Element.fieldDefinitions,
    identifierField,
    activeField,
    serviceCategoryField,
    serviceTypeField,
    specialtyField,
    actorField,
    planningHorizonField,
    commentField,
  ];

  static FixedList<Identifier>? _getIdentifier(JsonObject jo) =>
      switch (jo[identifierField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Identifier.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static bool? _getActive(JsonObject jo) => jo[activeField.name].booleanValue;

  static FixedList<CodeableConcept>? _getServiceCategory(JsonObject jo) =>
      switch (jo[serviceCategoryField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<CodeableConcept>? _getServiceType(JsonObject jo) =>
      switch (jo[serviceTypeField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<CodeableConcept>? _getSpecialty(JsonObject jo) =>
      switch (jo[specialtyField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value
                .map((e) => CodeableConcept.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static FixedList<Reference>? _getActor(JsonObject jo) =>
      switch (jo[actorField.name]) {
        (final JsonArray jsonArray) => FixedList(
            jsonArray.value.map((e) => Reference.fromJson(e as JsonObject)),
          ),
        _ => null,
      };

  static Period? _getPlanningHorizon(JsonObject jo) =>
      switch (jo[planningHorizonField.name]) {
        (final JsonObject jsonObject) => Period.fromJson(jsonObject),
        _ => null,
      };

  static String? _getComment(JsonObject jo) =>
      jo[commentField.name].stringValue;

  /// Creates a copy of the [Schedule] instance and allows for non-destructive mutation.
  Schedule copyWith({
    String? id,
    Meta? meta,
    FixedList<Identifier>? identifier,
    bool? active,
    FixedList<CodeableConcept>? serviceCategory,
    FixedList<CodeableConcept>? serviceType,
    FixedList<CodeableConcept>? specialty,
    FixedList<Reference>? actor,
    Period? planningHorizon,
    String? comment,
  }) =>
      Schedule(
        id: id ?? this.id,
        meta: meta ?? this.meta,
        identifier: identifier ?? this.identifier,
        active: active ?? this.active,
        serviceCategory: serviceCategory ?? this.serviceCategory,
        serviceType: serviceType ?? this.serviceType,
        specialty: specialty ?? this.specialty,
        actor: actor ?? this.actor,
        planningHorizon: planningHorizon ?? this.planningHorizon,
        comment: comment ?? this.comment,
      );
}

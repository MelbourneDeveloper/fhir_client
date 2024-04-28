import 'package:fhir_client/models/actor.dart';
import 'package:fhir_client/models/address.dart';
import 'package:fhir_client/models/admit_source.dart';
import 'package:fhir_client/models/available_time.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/codeable_reference.dart';
import 'package:fhir_client/models/entry.dart';
import 'package:fhir_client/models/extension.dart';
import 'package:fhir_client/models/fixed_list.dart';
import 'package:fhir_client/models/identifier.dart';
import 'package:fhir_client/models/issue.dart';
import 'package:fhir_client/models/link.dart';
import 'package:fhir_client/models/location.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/name.dart';
import 'package:fhir_client/models/participant.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/planning_horizon.dart';
import 'package:fhir_client/models/reference.dart';
import 'package:fhir_client/models/telecom.dart';
import 'package:fhir_client/models/text.dart';
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
sealed class Resource {
  Resource._internal(
    this.id,
    this.meta,
  );

  factory Resource.fromJson(
    Map<String, dynamic> map,
  ) =>
      switch (ResourceType.fromCode(map['resourceType'] as String? ?? '')) {
        (ResourceType.appointment) => Appointment.fromJson(map),
        (ResourceType.bundle) => Bundle.fromJson(map),
        (ResourceType.encounter) => Encounter.fromJson(map),
        (ResourceType.organization) => Organization.fromJson(map),
        (ResourceType.operationOutcome) =>
          OperationOutcome<String>.fromJson(map),
        (ResourceType.patient) => Patient.fromJson(map),
        (ResourceType.practitioner) => Practitioner.fromJson(map),
        (ResourceType.practitionerRole) => PractitionerRole.fromJson(map),
        (ResourceType.schedule) => Schedule.fromJson(map),
        (ResourceType.slot) => Slot.fromJson(map),
      };
  final String? id;
  final Meta? meta;
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

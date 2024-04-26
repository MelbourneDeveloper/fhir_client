import 'package:fhir_client/models/actor.dart';
import 'package:fhir_client/models/address.dart';
import 'package:fhir_client/models/available_time.dart';
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
  final List<T> entries;

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
            .toList(),
        participant: (json['participant'] as List<dynamic>?)
            ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
  static const ResourceType resourceType = ResourceType.appointment;

  final String? status;
  final List<CodeableConcept>? serviceCategory;
  final List<Participant>? participant;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'id': id,
        'meta': meta?.toJson(),
        'status': status,
        'serviceCategory': serviceCategory?.map((e) => e.toJson()).toList(),
        'participant': participant?.map((e) => e.toJson()).toList(),
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
            .toList(),
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toList(),
        active: json['active'] != null ? json['active'] as bool? : null,
        type: json['type'] as String?,
        name: json['name'] != null ? json['name'] as String? : null,
        code: (json['code'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toList(),
        location: (json['location'] as List<dynamic>?)
            ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
            .toList(),
        link: (json['link'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList(),
        entry: (json['entry'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
  static const ResourceType resourceType = ResourceType.bundle;

  final List<Extension>? extension;
  final List<Identifier>? identifier;
  final bool? active;
  final String? type;
  final String? name;
  final List<CodeableConcept>? code;
  final List<Location>? location;
  final List<Link>? link;
  final List<Entry>? entry;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'id': id,
        'meta': meta?.toJson(),
        'extension': extension?.map((e) => e.toJson()).toList(),
        'identifier': identifier?.map((e) => e.toJson()).toList(),
        'active': active,
        'type': type,
        'name': name,
        'code': code?.map((e) => e.toJson()).toList(),
        'location': location?.map((e) => e.toJson()).toList(),
        'link': link?.map((e) => e.toJson()).toList(),
        'entry': entry?.map((e) => e.toJson()).toList(),
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
            .toList(),
      );
  static const ResourceType resourceType = ResourceType.operationOutcome;

  final Text? text;
  final List<Issue>? issue;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'text': text?.toJson(),
        'issue': issue?.map((e) => e.toJson()).toList(),
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
            .toList(),
        type: (json['type'] as List<dynamic>?)
            ?.map((e) => t.Type.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] != null ? json['name'] as String? : null,
        total: json['total'] != null ? json['total'] as int? : null,
        link: (json['link'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList(),
        entry: (json['entry'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toList(),
        active: json['active'] as bool?,
        telecom: (json['telecom'] as List<dynamic>?)
            ?.map((e) => Telecom.fromJson(e as Map<String, dynamic>))
            .toList(),
        address: (json['address'] as List<dynamic>?)
            ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
  static const ResourceType resourceType = ResourceType.organization;

  final List<t.Type>? type;
  final String? name;
  final int? total;
  final List<Link>? link;
  final List<Entry>? entry;
  final List<Identifier>? identifier;
  final bool? active;
  final List<Telecom>? telecom;
  final List<Address>? address;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toList(),
        'type': type?.cast<dynamic>().toList(),
        'name': name,
        'total': total,
        'link': link?.map((e) => e.toJson()).toList(),
        'entry': entry?.map((e) => e.toJson()).toList(),
        'active': active,
        'telecom': telecom?.map((e) => e.toJson()).toList(),
        'address': address?.map((e) => e.toJson()).toList(),
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
            .toList(),
        active: json['active'] as bool?,
        name: (json['name'] as List<dynamic>?)
            ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
            .toList(),
        telecom: (json['telecom'] as List<dynamic>?)
            ?.map((e) => Telecom.fromJson(e as Map<String, dynamic>))
            .toList(),
        gender: json['gender'] != null
            ? AdministrativeGender.fromCode(json['gender'] as String)
            : null,
        birthDate: json['birthDate'] != null
            ? DateTime.parse(json['birthDate'] as String)
            : null,
        address: (json['address'] as List<dynamic>?)
            ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
  static const ResourceType resourceType = ResourceType.patient;

  final List<Identifier>? identifier;
  final bool? active;
  final List<Name>? name;
  final List<Telecom>? telecom;
  final AdministrativeGender? gender;
  final DateTime? birthDate;
  final List<Address>? address;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType.code,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toList(),
        'active': active,
        'name': name?.map((e) => e.toJson()).toList(),
        'telecom': telecom?.map((e) => e.toJson()).toList(),
        'gender': gender?.code,
        'birthDate': birthDate?.toIso8601String(),
        'address': address?.map((e) => e.toJson()).toList(),
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
            .toList(),
        type: (json['type'] as List<dynamic>?)
            ?.map((e) => t.Type.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: (json['name'] as List<dynamic>?)
            ?.map((e) => Name.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] != null ? json['total'] as int? : null,
        link: (json['link'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList(),
        entry: (json['entry'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toList(),
        active: json['active'] as bool?,
        telecom: (json['telecom'] as List<dynamic>?)
            ?.map((e) => Telecom.fromJson(e as Map<String, dynamic>))
            .toList(),
        address: (json['address'] as List<dynamic>?)
            ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
            .toList(),
        gender: AdministrativeGender.fromCode(
          json['gender'] as String? ?? 'unknown',
        ),
      );
      
  static const ResourceType resourceType = ResourceType.practitioner;

  final List<t.Type>? type;
  final List<Name>? name;
  final int? total;
  final List<Link>? link;
  final List<Entry>? entry;
  final List<Identifier>? identifier;
  final bool? active;
  final List<Telecom>? telecom;
  final List<Address>? address;
  final AdministrativeGender gender;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toList(),
        'type': type?.cast<dynamic>().toList(),
        'name': name?.map((e) => e.toJson()).toList(),
        'total': total,
        'link': link?.map((e) => e.toJson()).toList(),
        'entry': entry?.map((e) => e.toJson()).toList(),
        'active': active,
        'telecom': telecom?.map((e) => e.toJson()).toList(),
        'address': address?.map((e) => e.toJson()).toList(),
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
            .toList(),
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toList(),
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
            .toList(),
        specialty: (json['specialty'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toList(),
        location: (json['location'] as List<dynamic>?)
            ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
            .toList(),
        availableTime: (json['availableTime'] as List<dynamic>?)
            ?.map((e) => AvailableTime.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
      );
  static const ResourceType resourceType = ResourceType.practitionerRole;

  final List<Extension>? extension;
  final List<Identifier>? identifier;
  final bool? active;
  final String? name;
  final Period? period;
  final Reference? practitioner;
  final List<CodeableConcept>? code;
  final List<CodeableConcept>? specialty;
  final List<Location>? location;
  final List<AvailableTime>? availableTime;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'id': id,
        'extension': extension?.map((e) => e.toJson()).toList(),
        'identifier': identifier?.map((e) => e.toJson()).toList(),
        'active': active,
        'name': name,
        'period': period?.toJson(),
        'practitioner': practitioner?.toJson(),
        'code': code?.map((e) => e.toJson()).toList(),
        'specialty': specialty?.map((e) => e.toJson()).toList(),
        'location': location?.map((e) => e.toJson()).toList(),
        'availableTime': availableTime?.map((e) => e.toJson()).toList(),
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
            .toList(),
        serviceCategory: (json['serviceCategory'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toList(),
        serviceType: (json['serviceType'] as List<dynamic>?)
            ?.map((e) => CodeableReference.fromJson(e as Map<String, dynamic>))
            .toList(),
        specialty: (json['specialty'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toList(),
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
  static const ResourceType resourceType = ResourceType.slot;

  final List<Identifier>? identifier;
  final List<CodeableConcept>? serviceCategory;
  final List<CodeableReference>? serviceType;
  final List<CodeableConcept>? specialty;
  final CodeableConcept? appointmentType;
  final String? status;
  final DateTime? start;
  final DateTime? end;
  final String? comment;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toList(),
        'serviceCategory': serviceCategory?.map((e) => e.toJson()).toList(),
        'serviceType': serviceType?.map((e) => e.toJson()).toList(),
        'specialty': specialty?.map((e) => e.toJson()).toList(),
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
            .toList(),
        serviceType: (json['serviceType'] as List<dynamic>?)
            ?.map((e) => CodeableReference.fromJson(e as Map<String, dynamic>))
            .toList(),
        serviceCategory: (json['serviceCategory'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toList(),
        specialty: (json['specialty'] as List<dynamic>?)
            ?.map((e) => CodeableConcept.fromJson(e as Map<String, dynamic>))
            .toList(),
        actor: (json['actor'] as List<dynamic>?)
            ?.map((e) => Actor.fromJson(e as Map<String, dynamic>))
            .toList(),
        planningHorizon: json['planningHorizon'] != null
            ? PlanningHorizon.fromJson(
                json['planningHorizon'] as Map<String, dynamic>,
              )
            : null,
        comment: json['comment'] != null ? json['comment'] as String? : null,
      );
  static const ResourceType resourceType = ResourceType.schedule;

  final List<Identifier>? identifier;
  final List<CodeableReference>? serviceType;
  final List<CodeableConcept>? serviceCategory;
  final List<CodeableConcept>? specialty;
  final List<Actor>? actor;
  final PlanningHorizon? planningHorizon;
  final String? comment;
  final bool? active;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toList(),
        'serviceType': serviceType?.map((e) => e.toJson()).toList(),
        'serviceCategory': serviceType?.map((e) => e.toJson()).toList(),
        'specialty': specialty?.map((e) => e.toJson()).toList(),
        'actor': actor?.map((e) => e.toJson()).toList(),
        'planningHorizon': planningHorizon?.toJson(),
        'comment': comment,
        'active': active,
      };
}

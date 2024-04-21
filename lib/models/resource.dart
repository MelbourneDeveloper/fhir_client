// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/address.dart';
import 'package:fhir_client/models/available_time.dart';
import 'package:fhir_client/models/code.dart';
import 'package:fhir_client/models/entry.dart';
import 'package:fhir_client/models/extension.dart';
import 'package:fhir_client/models/identifier.dart';
import 'package:fhir_client/models/link.dart';
import 'package:fhir_client/models/location.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/reference.dart';
import 'package:fhir_client/models/specialty.dart';
import 'package:fhir_client/models/telecom.dart';
import 'package:fhir_client/models/type.dart' as t;

sealed class Resource {
  final String id;
  final String resourceType;
  final Meta? meta;

  Resource(
    this.id,
    this.resourceType,
    this.meta,
  );

  factory Resource.fromJson(
    Map<String, dynamic> map,
  ) =>
      switch (map['resourceType']) {
        ('PractitionerRole') => PractitionerRole.fromJson(map),
        ('Organization') => Organization.fromJson(map),
        (_) => throw UnimplementedError(
            'Hey you! This resource is not implemented! Please head over to https://github.com/MelbourneDeveloper/fhir_client and write a PR to add this resource.',
          ),
      };
}

final class Organization extends Resource {
  final List<t.Type>? type;
  final String? name;
  final int? total;
  final List<Link>? link;
  final List<Entry>? entry;
  final List<Identifier>? identifier;
  final bool? active;
  final List<Telecom>? telecom;
  final List<Address>? address;

  Organization({
    required String resourceType,
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
  }) : super(
          id,
          resourceType,
          meta,
        );

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      resourceType: json['resourceType'] as String,
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
  }

  Map<String, dynamic> toJson() {
    return {
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
}

final class PractitionerRole extends Resource {
  final List<Extension>? extension;
  final List<Identifier>? identifier;
  final bool? active;
  final String? name;
  final Period? period;
  final Reference? practitioner;
  final List<Code>? code;
  final List<Specialty>? specialty;
  final List<Location>? location;
  final List<AvailableTime>? availableTime;

  PractitionerRole({
    required String id,
    required String resourceType,
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
  }) : super(
          id,
          resourceType,
          meta,
        );

  factory PractitionerRole.fromJson(Map<String, dynamic> json) {
    return PractitionerRole(
      resourceType: json['resourceType'] as String,
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
          ?.map((e) => Code.fromJson(e as Map<String, dynamic>))
          .toList(),
      specialty: (json['specialty'] as List<dynamic>?)
          ?.map((e) => Specialty.fromJson(e as Map<String, dynamic>))
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
  }

  Map<String, dynamic> toJson() {
    return {
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
}

class Bundle extends Resource {
  final List<Extension>? extension;
  final List<Identifier>? identifier;
  final bool? active;
  final String? type;
  final String? name;
  final List<Code>? code;
  final List<Location>? location;
  final List<Link>? link;
  final List<Entry>? entry;

  Bundle({
    required String id,
    required String resourceType,
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
  }) : super(
          id,
          resourceType,
          meta,
        );

  factory Bundle.fromJson(Map<String, dynamic> json) {
    return Bundle(
      resourceType: json['resourceType'] as String,
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
          ?.map((e) => Code.fromJson(e as Map<String, dynamic>))
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
  }

  Map<String, dynamic> toJson() {
    return {
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
}

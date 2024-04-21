// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/address.dart';
import 'package:fhir_client/models/available_time.dart';
import 'package:fhir_client/models/code.dart';
import 'package:fhir_client/models/extension.dart';
import 'package:fhir_client/models/identifier.dart';
import 'package:fhir_client/models/location.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/period.dart';
import 'package:fhir_client/models/practitioner.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/specialty.dart';
import 'package:fhir_client/models/telecom.dart';
import 'package:fhir_client/models/type.dart' as t;

class Bundle extends Resource {
  final Meta? meta;
  final List<Extension>? extension;
  final List<Identifier>? identifier;
  final bool? active;
  final List<t.Type>? type;
  final String? name;
  final List<Telecom>? telecom;
  final List<Address>? address;
  final Period? period;
  final Practitioner? practitioner;
  final List<Code>? code;
  final List<Specialty>? specialty;
  final List<Location>? location;
  final List<AvailableTime>? availableTime;

  Bundle({
    required String id,
    required String resourceType,
    this.meta,
    this.extension,
    this.identifier,
    this.active,
    this.type,
    this.name,
    this.period,
    this.practitioner,
    this.code,
    this.specialty,
    this.location,
    this.availableTime,
    this.telecom,
    this.address,
  }) : super(
          id,
          resourceType,
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
      type: (json['type'] as List<dynamic>?)
          ?.map((e) => t.Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] != null ? json['name'] as String? : null,
      period: json['period'] != null
          ? Period.fromJson(json['period'] as Map<String, dynamic>)
          : null,
      practitioner: json['practitioner'] != null
          ? Practitioner.fromJson(json['practitioner'] as Map<String, dynamic>)
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
      'extension': extension?.map((e) => e.toJson()).toList(),
      'identifier': identifier?.map((e) => e.toJson()).toList(),
      'active': active,
      'type': type?.map((e) => e.toJson()).toList(),
      'name': name,
      'period': period?.toJson(),
      'practitioner': practitioner?.toJson(),
      'code': code?.map((e) => e.toJson()).toList(),
      'specialty': specialty?.map((e) => e.toJson()).toList(),
      'location': location?.map((e) => e.toJson()).toList(),
      'availableTime': availableTime?.map((e) => e.toJson()).toList(),
      'telecom': telecom?.map((e) => e.toJson()).toList(),
      'address': address?.map((e) => e.toJson()).toList(),
    };
  }
}

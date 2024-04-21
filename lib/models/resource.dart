// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

import 'package:fhir_client/models/address.dart';
import 'package:fhir_client/models/identifier.dart';
import 'package:fhir_client/models/meta.dart';
import 'package:fhir_client/models/telecom.dart';
import 'package:fhir_client/models/type.dart';

class Resource {
  final String? resourceType;
  final String? id;
  final Meta? meta;
  final List<Identifier>? identifier;
  final bool? active;
  final List<Type>? type;
  final String? name;
  final List<Telecom>? telecom;
  final List<Address>? address;

  Resource({
    this.resourceType,
    this.id,
    this.meta,
    this.identifier,
    this.active,
    this.type,
    this.name,
    this.telecom,
    this.address,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      resourceType:
          json['resourceType'] != null ? json['resourceType'] as String? : null,
      id: json['id'] != null ? json['id'] as String? : null,
      meta: json['meta'] != null
          ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
          : null,
      identifier: (json['identifier'] as List<dynamic>?)
          ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      active: json['active'] != null ? json['active'] as bool? : null,
      type: (json['type'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] != null ? json['name'] as String? : null,
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
      'active': active,
      'type': type?.map((e) => e.toJson()).toList(),
      'name': name,
      'telecom': telecom?.map((e) => e.toJson()).toList(),
      'address': address?.map((e) => e.toJson()).toList(),
    };
  }
}

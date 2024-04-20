// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Result {
  final String? resourceType;
  final String? id;
  final Meta? meta;
  final String? type;
  final int? total;
  final List<Link>? link;
  final List<Entry>? entry;

  Result({
    this.resourceType,
    this.id,
    this.meta,
    this.type,
    this.total,
    this.link,
    this.entry,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      resourceType:
          json['resourceType'] != null ? json['resourceType'] as String? : null,
      id: json['id'] != null ? json['id'] as String? : null,
      meta: json['meta'] != null
          ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
          : null,
      type: json['type'] != null ? json['type'] as String? : null,
      total: json['total'] != null ? json['total'] as int? : null,
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
      'type': type,
      'total': total,
      'link': link?.map((e) => e.toJson()).toList(),
      'entry': entry?.map((e) => e.toJson()).toList(),
    };
  }
}

class Meta {
  final String? lastUpdated;

  Meta({
    this.lastUpdated,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      lastUpdated:
          json['lastUpdated'] != null ? json['lastUpdated'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastUpdated': lastUpdated,
    };
  }
}

class Link {
  final String? relation;
  final String? url;

  Link({
    this.relation,
    this.url,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      relation: json['relation'] != null ? json['relation'] as String? : null,
      url: json['url'] != null ? json['url'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'relation': relation,
      'url': url,
    };
  }
}

class Entry {
  final String? fullUrl;
  final Resource? resource;
  final Search? search;

  Entry({
    this.fullUrl,
    this.resource,
    this.search,
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      fullUrl: json['fullUrl'] != null ? json['fullUrl'] as String? : null,
      resource: json['resource'] != null
          ? Resource.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
      search: json['search'] != null
          ? Search.fromJson(json['search'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullUrl': fullUrl,
      'resource': resource?.toJson(),
      'search': search?.toJson(),
    };
  }
}

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

class Identifier {
  final Type? type;
  final String? system;
  final String? value;

  Identifier({
    this.type,
    this.system,
    this.value,
  });

  factory Identifier.fromJson(Map<String, dynamic> json) {
    return Identifier(
      type: json['type'] != null
          ? Type.fromJson(json['type'] as Map<String, dynamic>)
          : null,
      system: json['system'] != null ? json['system'] as String? : null,
      value: json['value'] != null ? json['value'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type?.toJson(),
      'system': system,
      'value': value,
    };
  }
}

class Type {
  final String? text;

  Type({
    this.text,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      text: json['text'] != null ? json['text'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
    };
  }
}

class Telecom {
  final String? system;
  final String? value;
  final String? use;

  Telecom({
    this.system,
    this.value,
    this.use,
  });

  factory Telecom.fromJson(Map<String, dynamic> json) {
    return Telecom(
      system: json['system'] != null ? json['system'] as String? : null,
      value: json['value'] != null ? json['value'] as String? : null,
      use: json['use'] != null ? json['use'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'system': system,
      'value': value,
      'use': use,
    };
  }
}

class Address {
  final String? use;
  final String? type;
  final List<String>? line;
  final String? city;
  final String? district;
  final String? state;
  final String? postalCode;
  final String? country;

  Address({
    this.use,
    this.type,
    this.line,
    this.city,
    this.district,
    this.state,
    this.postalCode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      use: json['use'] != null ? json['use'] as String? : null,
      type: json['type'] != null ? json['type'] as String? : null,
      line: (json['line'] as List<dynamic>?)?.map((e) => e as String).toList(),
      city: json['city'] != null ? json['city'] as String? : null,
      district: json['district'] != null ? json['district'] as String? : null,
      state: json['state'] != null ? json['state'] as String? : null,
      postalCode:
          json['postalCode'] != null ? json['postalCode'] as String? : null,
      country: json['country'] != null ? json['country'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'use': use,
      'type': type,
      'line': line?.toList(),
      'city': city,
      'district': district,
      'state': state,
      'postalCode': postalCode,
      'country': country,
    };
  }
}

class Search {
  final String? mode;

  Search({
    this.mode,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      mode: json['mode'] != null ? json['mode'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mode': mode,
    };
  }
}

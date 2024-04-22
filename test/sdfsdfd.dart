class Root {
  Root({
    this.resourceType,
    this.id,
    this.meta,
    this.type,
    this.link,
    this.entry,
  });

  factory Root.fromJson(Map<String, dynamic> json) => Root(
        resourceType: json['resourceType'] != null
            ? json['resourceType'] as String?
            : null,
        id: json['id'] != null ? json['id'] as String? : null,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        type: json['type'] != null ? json['type'] as String? : null,
        link: (json['link'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList(),
        entry: (json['entry'] as List<dynamic>?)
            ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
  final String? resourceType;
  final String? id;
  final Meta? meta;
  final String? type;
  final List<Link>? link;
  final List<Entry>? entry;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'id': id,
        'meta': meta?.toJson(),
        'type': type,
        'link': link?.map((e) => e.toJson()).toList(),
        'entry': entry?.map((e) => e.toJson()).toList(),
      };
}

class Meta {
  Meta({
    this.lastUpdated,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        lastUpdated:
            json['lastUpdated'] != null ? json['lastUpdated'] as String? : null,
      );
  final String? lastUpdated;

  Map<String, dynamic> toJson() => {
        'lastUpdated': lastUpdated,
      };
}

class Link {
  Link({
    this.relation,
    this.url,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        relation: json['relation'] != null ? json['relation'] as String? : null,
        url: json['url'] != null ? json['url'] as String? : null,
      );
  final String? relation;
  final String? url;

  Map<String, dynamic> toJson() => {
        'relation': relation,
        'url': url,
      };
}

class Entry {
  Entry({
    this.fullUrl,
    this.resource,
    this.search,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        fullUrl: json['fullUrl'] != null ? json['fullUrl'] as String? : null,
        resource: json['resource'] != null
            ? Resource.fromJson(json['resource'] as Map<String, dynamic>)
            : null,
        search: json['search'] != null
            ? Search.fromJson(json['search'] as Map<String, dynamic>)
            : null,
      );
  final String? fullUrl;
  final Resource? resource;
  final Search? search;

  Map<String, dynamic> toJson() => {
        'fullUrl': fullUrl,
        'resource': resource?.toJson(),
        'search': search?.toJson(),
      };
}

class Resource {
  Resource({
    this.resourceType,
    this.id,
    this.meta,
    this.identifier,
    this.serviceType,
    this.actor,
    this.planningHorizon,
    this.comment,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        resourceType: json['resourceType'] != null
            ? json['resourceType'] as String?
            : null,
        id: json['id'] != null ? json['id'] as String? : null,
        meta: json['meta'] != null
            ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
            : null,
        identifier: (json['identifier'] as List<dynamic>?)
            ?.map((e) => Identifier.fromJson(e as Map<String, dynamic>))
            .toList(),
        serviceType: (json['serviceType'] as List<dynamic>?)
            ?.map((e) => ServiceType.fromJson(e as Map<String, dynamic>))
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
  final String? resourceType;
  final String? id;
  final Meta? meta;
  final List<Identifier>? identifier;
  final List<ServiceType>? serviceType;
  final List<Actor>? actor;
  final PlanningHorizon? planningHorizon;
  final String? comment;

  Map<String, dynamic> toJson() => {
        'resourceType': resourceType,
        'id': id,
        'meta': meta?.toJson(),
        'identifier': identifier?.map((e) => e.toJson()).toList(),
        'serviceType': serviceType?.map((e) => e.toJson()).toList(),
        'actor': actor?.map((e) => e.toJson()).toList(),
        'planningHorizon': planningHorizon?.toJson(),
        'comment': comment,
      };
}

class Identifier {
  Identifier({
    this.system,
    this.value,
  });
  factory Identifier.fromJson(Map<String, dynamic> json) => Identifier(
        system: json['system'] != null ? json['system'] as String? : null,
        value: json['value'] != null ? json['value'] as String? : null,
      );
  final String? system;
  final String? value;

  Map<String, dynamic> toJson() => {
        'system': system,
        'value': value,
      };
}

class ServiceType {
  ServiceType({
    this.coding,
    this.text,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        coding: (json['coding'] as List<dynamic>?)
            ?.map((e) => Coding.fromJson(e as Map<String, dynamic>))
            .toList(),
        text: json['text'] != null ? json['text'] as String? : null,
      );
  final List<Coding>? coding;
  final String? text;

  Map<String, dynamic> toJson() => {
        'coding': coding?.map((e) => e.toJson()).toList(),
        'text': text,
      };
}

class Coding {
  Coding({
    this.system,
    this.code,
    this.display,
  });

  factory Coding.fromJson(Map<String, dynamic> json) => Coding(
        system: json['system'] != null ? json['system'] as String? : null,
        code: json['code'] != null ? json['code'] as String? : null,
        display: json['display'] != null ? json['display'] as String? : null,
      );
  final String? system;
  final String? code;
  final String? display;

  Map<String, dynamic> toJson() => {
        'system': system,
        'code': code,
        'display': display,
      };
}

class Actor {
  Actor({
    this.reference,
    this.display,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        reference:
            json['reference'] != null ? json['reference'] as String? : null,
        display: json['display'] != null ? json['display'] as String? : null,
      );
  final String? reference;
  final String? display;

  Map<String, dynamic> toJson() => {
        'reference': reference,
        'display': display,
      };
}

class PlanningHorizon {
  PlanningHorizon({
    this.start,
    this.end,
  });

  factory PlanningHorizon.fromJson(Map<String, dynamic> json) =>
      PlanningHorizon(
        start: json['start'] != null ? json['start'] as String? : null,
        end: json['end'] != null ? json['end'] as String? : null,
      );
  final String? start;
  final String? end;

  Map<String, dynamic> toJson() => {
        'start': start,
        'end': end,
      };
}

class Search {
  Search({
    this.mode,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        mode: json['mode'] != null ? json['mode'] as String? : null,
      );
  final String? mode;

  Map<String, dynamic> toJson() => {
        'mode': mode,
      };
}

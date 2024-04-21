// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

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

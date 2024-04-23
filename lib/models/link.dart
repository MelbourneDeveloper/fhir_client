// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Link {
  final String? relation;
  final Uri? url;

  Link({
    this.relation,
    this.url,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      relation: json['relation'] != null ? json['relation'] as String? : null,
      url: Uri.tryParse(json['url'] as String? ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'relation': relation,
      'url': url.toString(),
    };
  }
}

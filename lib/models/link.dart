class Link {
  Link({
    this.relation,
    this.url,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        relation: json['relation'] != null ? json['relation'] as String? : null,
        url: Uri.tryParse(json['url'] as String? ?? ''),
      );
  final String? relation;
  final Uri? url;

  Map<String, dynamic> toJson() => {
        'relation': relation,
        'url': url.toString(),
      };
}

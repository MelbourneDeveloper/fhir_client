class Extension {
  Extension({
    this.url,
    this.extension,
    this.valueBoolean,
  });

  factory Extension.fromJson(Map<String, dynamic> json) => Extension(
        url: Uri.tryParse(json['url'] as String? ?? ''),
        extension: (json['extension'] as List<dynamic>?)
            ?.map((e) => Extension.fromJson(e as Map<String, dynamic>))
            .toList(),
        valueBoolean:
            json['valueBoolean'] != null ? json['valueBoolean'] as bool? : null,
      );

  final Uri? url;
  final List<Extension>? extension;
  final bool? valueBoolean;

  Map<String, dynamic> toJson() => {
        'url': url.toString(),
        'extension': extension?.map((e) => e.toJson()).toList(),
        'valueBoolean': valueBoolean,
      };
}

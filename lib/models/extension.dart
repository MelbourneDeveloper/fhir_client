// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Extension {
  final Uri? url;
  final List<Extension>? extension;
  final bool? valueBoolean;

  Extension({
    this.url,
    this.extension,
    this.valueBoolean,
  });

  factory Extension.fromJson(Map<String, dynamic> json) {
    return Extension(
      url: Uri.tryParse(json['url'] as String? ?? ''),
      extension: (json['extension'] as List<dynamic>?)
          ?.map((e) => Extension.fromJson(e as Map<String, dynamic>))
          .toList(),
      valueBoolean:
          json['valueBoolean'] != null ? json['valueBoolean'] as bool? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'extension': extension?.map((e) => e.toJson()).toList(),
      'valueBoolean': valueBoolean,
    };
  }
}

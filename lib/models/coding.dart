class Coding {
  Coding({
    this.system,
    this.code,
    this.display,
  });

  factory Coding.fromJson(Map<String, dynamic> json) => Coding(
        system: Uri.tryParse(json['system'] as String? ?? ''),
        code: json['code'] != null ? json['code'] as String? : null,
        display: json['display'] != null ? json['display'] as String? : null,
      );
  final Uri? system;
  final String? code;
  final String? display;

  Map<String, dynamic> toJson() => {
        'system': system.toString(),
        'code': code,
        'display': display,
      };
}

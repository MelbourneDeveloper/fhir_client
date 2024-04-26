class Tag {
  Tag({
    this.system,
    this.code,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        system: json['system'] != null ? json['system'] as String? : null,
        code: json['code'] != null ? json['code'] as String? : null,
      );
  final String? system;
  final String? code;

  Map<String, dynamic> toJson() => {
        'system': system,
        'code': code,
      };
}

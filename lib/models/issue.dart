class Issue {
  Issue({
    this.severity,
    this.code,
    this.diagnostics,
  });

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        severity: json['severity'] != null ? json['severity'] as String? : null,
        code: json['code'] != null ? json['code'] as String? : null,
        diagnostics:
            json['diagnostics'] != null ? json['diagnostics'] as String? : null,
      );
  final String? severity;
  final String? code;
  final String? diagnostics;

  Map<String, dynamic> toJson() => {
        'severity': severity,
        'code': code,
        'diagnostics': diagnostics,
      };
}

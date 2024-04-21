// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Issue {
  final String? severity;
  final String? code;
  final String? diagnostics;

  Issue({
    this.severity,
    this.code,
    this.diagnostics,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      severity: json['severity'] != null ? json['severity'] as String? : null,
      code: json['code'] != null ? json['code'] as String? : null,
      diagnostics:
          json['diagnostics'] != null ? json['diagnostics'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'severity': severity,
      'code': code,
      'diagnostics': diagnostics,
    };
  }
}

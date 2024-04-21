// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Error {
  final String? resourceType;
  final Text? text;
  final List<Issue>? issue;

  Error({
    this.resourceType,
    this.text,
    this.issue,
  });

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      resourceType:
          json['resourceType'] != null ? json['resourceType'] as String? : null,
      text: json['text'] != null
          ? Text.fromJson(json['text'] as Map<String, dynamic>)
          : null,
      issue: (json['issue'] as List<dynamic>?)
          ?.map((e) => Issue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resourceType': resourceType,
      'text': text?.toJson(),
      'issue': issue?.map((e) => e.toJson()).toList(),
    };
  }
}

class Text {
  final String? status;
  final String? div;

  Text({
    this.status,
    this.div,
  });

  factory Text.fromJson(Map<String, dynamic> json) {
    return Text(
      status: json['status'] != null ? json['status'] as String? : null,
      div: json['div'] != null ? json['div'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'div': div,
    };
  }
}

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

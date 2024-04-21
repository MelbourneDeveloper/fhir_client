// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Period {
  final String? start;
  final String? end;

  Period({
    this.start,
    this.end,
  });

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      start: json['start'] != null ? json['start'] as String? : null,
      end: json['end'] != null ? json['end'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'end': end,
    };
  }
}

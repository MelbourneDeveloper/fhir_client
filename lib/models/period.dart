class Period {
  Period({
    this.start,
    this.end,
  });

  factory Period.fromJson(Map<String, dynamic> json) => Period(
        start: json['start'] != null ? json['start'] as String? : null,
        end: json['end'] != null ? json['end'] as String? : null,
      );
  final String? start;
  final String? end;

  Map<String, dynamic> toJson() => {
        'start': start,
        'end': end,
      };
}

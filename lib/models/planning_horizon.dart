class PlanningHorizon {
  PlanningHorizon({
    this.start,
    this.end,
  });

  factory PlanningHorizon.fromJson(Map<String, dynamic> json) =>
      PlanningHorizon(
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

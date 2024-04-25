class PlanningHorizon {
  PlanningHorizon({
    this.start,
    this.end,
  });

  factory PlanningHorizon.fromJson(Map<String, dynamic> json) =>
      PlanningHorizon(
        start: DateTime.tryParse(json['start'] as String? ?? ''),
        end: DateTime.tryParse(json['end'] as String? ?? ''),
      );

  final DateTime? start;
  final DateTime? end;

  Map<String, dynamic> toJson() => {
        'start': start.toString(),
        'end': end.toString(),
      };
}

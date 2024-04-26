class Text {
  Text({
    this.status,
    this.div,
  });

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        status: json['status'] != null ? json['status'] as String? : null,
        div: json['div'] != null ? json['div'] as String? : null,
      );
  final String? status;
  final String? div;

  Map<String, dynamic> toJson() => {
        'status': status,
        'div': div,
      };
}

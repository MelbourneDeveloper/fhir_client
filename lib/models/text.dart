// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

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

// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Type {
  final String? text;

  Type({
    this.text,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      text: json['text'] != null ? json['text'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
    };
  }
}

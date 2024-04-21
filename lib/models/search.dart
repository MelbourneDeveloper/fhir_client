// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies

class Search {
  final String? mode;

  Search({
    this.mode,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      mode: json['mode'] != null ? json['mode'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mode': mode,
    };
  }
}

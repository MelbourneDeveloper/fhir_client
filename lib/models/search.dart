class Search {
  Search({
    this.mode,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        mode: json['mode'] != null ? json['mode'] as String? : null,
      );
  final String? mode;

  Map<String, dynamic> toJson() => {
        'mode': mode,
      };
}

import 'package:fhir_client/models/basic_types/time.dart';

class StringBackedValue<T> {
  StringBackedValue(this.text)
      : _value = switch (T) {
          (const (Time)) => Time.tryParse(text ?? '') as T?,
          (const (DateTime)) => DateTime.tryParse(text ?? '') as T?,
          (const (Uri)) => Uri.tryParse(text ?? '') as T?,
          _ => null as T?,
        };

  // ignore: avoid_annotating_with_dynamic
  StringBackedValue.fromJson(Map<String, dynamic> json, String key)
      : this(json[key] is String ? json[key] as String : null);

  StringBackedValue.empty() : this(null);

  T? get value => _value;
  final String? text;
  final T? _value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is String && other == text ||
      (other is StringBackedValue && other.text == text);

  @override
  int get hashCode => text.hashCode;
}

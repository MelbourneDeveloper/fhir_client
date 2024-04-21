// ignore_for_file: sort_constructors_first, prefer_expression_function_bodies


abstract class Resource {
  final String id;
  final String resourceType;

  Resource(
    this.id,
    this.resourceType,
  );
}

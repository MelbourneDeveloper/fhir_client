import 'package:jayse/jayse.dart';

class Reference {
  Reference.fromJson(this._json);

  final JsonObject _json;

  String? get reference => _json['reference'].stringValue;

  JsonObject get json => _json;
}

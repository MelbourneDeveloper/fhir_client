import 'package:fhir_client/models/actor.dart';

class Participant {
  Participant({
    this.actor,
    this.status,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        actor: json['actor'] != null
            ? Actor.fromJson(json['actor'] as Map<String, dynamic>)
            : null,
        status: json['status'] != null ? json['status'] as String? : null,
      );
  final Actor? actor;
  final String? status;

  Map<String, dynamic> toJson() => {
        'actor': actor?.toJson(),
        'status': status,
      };
}

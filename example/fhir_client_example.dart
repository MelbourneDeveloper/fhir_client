import 'package:fhir_client/fhir_extensions.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:http/http.dart';

Future<void> main() async {

  //The base API URI
  const baseUri = 'http://hapi.fhir.org/';

  //The path, including the version and query parameters
  //Note: this library will add some helpers to make this more organized
  const path = 'baseR4/PractitionerRole?_count=10';

  //Use any old HTTP Client and you can mock this
  final client = Client();

  //Makes the call to the server and returns a resource. This might be a Bundle
  //but it could also be an OperationOutcome, indicating an error
  final resultingResource = await client.getResource(baseUri, path);

  //Switch in the resource type to format a disply
  final formattedResult = switch (resultingResource) {
    (final OperationOutcome oo) => 'Error: ${oo.text!.status}\n${oo.text?.div}',
    (final Bundle bundle) => bundle.entry!
        //Format all the practitioner references into a single string
        .map(
          (e) => switch (e.resource) {
            (final PractitionerRole pr) =>
              pr.practitioner?.reference ?? 'Unknown',
            (_) => "This can't happen but the compiler don't know that."
          },
        )
        .join('\n'),
    (_) => "This can't happen but the compiler don't know that."
  };

  // ignore: avoid_print
  print(formattedResult);
}

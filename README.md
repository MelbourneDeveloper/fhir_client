# fhir_client

## Build Modern Healthcare Systems with Flutter and Dart

`fhir_client` simplifies working with FHIR® data in Dart. It provides a user-friendly API for interacting with FHIR® servers and stands out for its non-destructive JSON handling. It uses the library [`Jayse`](https://github.com/MelbourneDeveloper/Jayse) to preserve the integrity of FHIR® data during the serialization and deserialization processes. This feature ensures that all data elements are accurately represented, enabling type-safe operations without data loss when working with FHIR® servers.

The source generator generates the resource model code from the FHIR® definitions, ensuring that the models match the FHIR® version. The current aim is R4, but importantly, the library is designed to work with any server version without causing data loss or corruption.

It offers straightforward methods for various FHIR operations such as searching for resources with a basic Dart `http` client. An extensive test suite proves the robustness so you can be sure that the library provides reliable and efficient development for interoperable healthcare applications. 

#### Disclaimer

<small>FHIR® is a registered trademark of Health Level Seven International (HL7®). This project is not affiliated with, endorsed, sponsored, or specifically approved by HL7® and does not purport to have any endorsement from HL7®. For more information, please visit https://www.hl7.org/fhir/. All copyrights © in FHIR® specifications are owned by HL7®.</small>

## Basics

This code searches for practitioner schedules. The code doesn't throw exceptions and you can guarantee it will return one of the two types you see here. When there is an error, the code will return an `OperationOutcome`.

```dart
//Search schedules and limit by count
final searchSchedulesResult =
    await client.searchSchedules(baseUri, count: 10);

//Display the result
print('Schedules:');
print(
  // The result can only be BundleEntries<Schedule> or
  // OperationOutcome<Schedule> so this switch expression is exhaustive
  switch (searchSchedulesResult) {
    (final BundleEntries<Schedule> schedules) =>
      schedules.entries.map(formatSchedule),
    (final OperationOutcome<Schedule> oo) =>
      'Error: ${oo.text!.status}\n${oo.text?.div}',
  },
);
```

## What is FHIR®?

[FHIR®](https://www.hl7.org/fhir/overview.html) stands for Fast Healthcare Interoperability Resources. It is a standard describing data formats and elements known as "resources" and an application programming interface (API) for exchanging electronic health records (EHR). The standard was created by the Health Level Seven International (HL7®) healthcare standards organization, and they own the trademark. 

## What is a FHIR Server?

A [FHIR server](https://build.fhir.org/http.html) is a server that implements the FHIR standard as HTTP REST. It is a server that can store and retrieve FHIR resources. There are several open-source and commercial implementations of the server, and there are [freely available test servers](https://confluence.hl7.org/display/FHIR/Public+Test+Servers). The tests and examples in this repo use the [HAPI test server](https://hapifhir.io/). 

## Is it on-prem? Or Cloud?

The FHIR® server can be deployed on-prem or in the cloud. You can license a version of FHIR® Server, or you can use an open-source implementation such as [Microsoft's .NET one](https://github.com/microsoft/fhir-server). All the major cloud providers have an offering: 

- [Google Cloud Cloud Healthcare API](https://cloud.google.com/healthcare-api?hl=en) 
- [AWS HealthLake](https://aws.amazon.com/healthlake/), 
- [Azure Health Data Services](https://azure.microsoft.com/en-us/services/azure-api-for-fhir/)

Privacy and security are paramount in healthcare, so you should choose a provider that is compliant with the [Health Insurance Portability and Accountability Act (HIPAA)](https://www.hhs.gov/hipaa/index.html), [HITRUST®](https://hitrustalliance.net/) and the [General Data Protection Regulation (GDPR)](https://gdpr.eu/). All the major providers offer compliance so there's no need to spend time and effort implementing your own health compliance. 

## A Note on Modern Healthcare Systems

Health systems around the world are fragmented and aging. Many hospitals and doctors still use paper records. The systems that are digital are often old and not interoperable. This is changing rapidly. The FHIR® standard is the future of health systems, and health outcomes depend on the interoperability of health records.

If you're working on an aging system that doesn't implement FHIR®, you need to consider upgrading to a system that does, or at least implementing a FHIR® server that can act as a bridge between your system and other health systems. 

Governments all over the world are mandating FHIR for record keeping and moving to FHIR® is a safe bet. This is [what they US government has to say](https://www.hhs.gov/about/news/2023/03/27/new-federal-health-strategy-sights-heathier-innovative-equitable-health-care-experience.html):

> Health IT is integral to how health care is delivered, how health is managed, and how the health of populations and communities is tracked. Thanks in part to the development of common standards, such as the United States Core Data for Interoperability (USCDI) and Health Level Seven International® (HL7®) Fast Healthcare Interoperability Resources® (FHIR®), health information has become more accessible and useful. 

## Getting Started

Just install the this library in the usual way. The library adds several extension methods to the `http` package `Client` class and that's it. For example, this the example project searches for several different resources in parallel. It's safe to do this because each call will return a result instead of throwing an exception. 

```dart
import 'package:fhir_client/fhir_extensions.dart';
import 'package:fhir_client/models/basic_types/fixed_list.dart';
import 'package:fhir_client/models/codeable_concept.dart';
import 'package:fhir_client/models/reference.dart';
import 'package:fhir_client/models/resource.dart';
import 'package:fhir_client/models/value_sets/slot_status.dart';
import 'package:http/http.dart';

//The base HAPI API URI
const baseUri = 'http://hapi.fhir.org/';

Future<void> main() async {
  //Use any old HTTP Client and you can mock this
  final client = Client();

  final results = await Future.wait([
    client.searchSlots(
      baseUri,
      count: 10,
      status: SlotStatus.free,
    ),
    client.searchSchedules(baseUri, count: 10),
    client.searchPractitionerRoles(baseUri, count: 10),
  ]);

  final formattedResult = results
      .map(
        (result) => switch (result) {
          (final BundleEntries<Schedule> schedules) =>
            'Schedules:\n\n${schedules.formatResult(_formatSchedule)}',
          (final BundleEntries<Slot> slots) =>
            'Slots:\n\n${slots.formatResult(_formatSlot)}',
          (final BundleEntries<PractitionerRole> roles) =>
            'PractitionerRoles:\n\n'
                '${roles.formatResult(_formatPractitionerRole)}',
          (final OperationOutcome<Resource> oo) when oo.text != null =>
            'Error: ${oo.text?.status}\n'
                '${oo.text?.div}',
          _ => 'Unknown Result',
        },
      )
      .join('\n');

  print(formattedResult);
}
```

Notice that using pattern matching with the [`switch` expression](https://www.christianfindlay.com/blog/dart-switch-expressions) is a great way to handle the two possible outcomes of the search because it supports pattern matching.

## Testing and Mocking

The library is designed to make testing easy. You can use the [`MockClient`](https://pub.dev/documentation/http/latest/http.testing/MockClient-class.html) class from the `http` package to mock the client. This is how you can mock the client, and you can find [this code](https://github.com/MelbourneDeveloper/fhir_client/blob/e72f37284b1bced7c82f9bef3f079581e4e7b61c/test/fhir_client_test.dart#L361) in the tests. Replace the file path with the path to a JSON file representing the response. This also works in widget tests. 

```dart
MockClient _mockClient(String filePath) => MockClient(
      (r) => Future.value(
        Response(
          File(filePath).readAsStringSync(),
          200,
        ),
      ),
    );
```

Here is an example of using the client extensions with a mocked client.

```dart
group('getResource API Call Tests', () {
  /// A test function that can be called with a mocked client
  /// or a real one
  Future<void> readOrganization(Client client) async {
    const path = 'baseR4/Organization/2640211';

    final result =
        await client.getResource<Organization>(baseUri, path) as Organization;

    expect(result.id, '2640211');
    expect(result.identifier!.first.type!.text, 'SNO');
  }
  // ...
});
```
### Step By Step Guide

1. Use curl to get the JSON response from your FHIR server. For example:

```bash
curl -X GET "http://hapi.fhir.org/baseR4/Organization/2640211" -H "Content-Type: application/json"
```

2. Save the JSON response to a file. For example [this file](test/responses/readorg.json). 

3. Create a `MockClient` in your test using the function above, and pass in the filename.

4. Create a test that calls the extensions with the `MockClient` and the path to the file. For example:

```dart
final client = _mockClient('test/responses/readorg.json');

final result = await client.getResource<Organization>(baseUri, path) as Organization;
```

5. Make your assertions

For widget tests, just inject the `MockClient` at the base of your app instead of the standard `http` `Client`. You will be able to dynamically load JSON files based on the request URI path in the mock function.

## Contributing

The repo is in its early stage. There is a source code generator that uses the FHIR® definitions to generate the models. The generator is in the `fhir_generator` folder. The generator is almost complete, and there are more resources being added all the time. Take a look at [this file](lib/models/resource.dart) to see what currently exists. The aim is to have a complete set of models for all the FHIR® resources. If you can help with this, please send a PR.
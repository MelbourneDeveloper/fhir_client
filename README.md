# fhir_client

**Build modern health systems with Flutter and Dart**

This package is a FHIR Server API client for Dart and Flutter. It is designed to be simple and easy to use. It uses the `http` package and Result Objects are [Dart Algebraic Data Types (ADTs)](https://dart.dev/language/patterns#algebraic-data-types), which makes error handling, as well as dealing with the various FHIR Resource types straightforward.

## Show Me The Code

This code searches for practitioner schedules. The code doesn't throw exceptions and you can guarantee it will return one of the two types you see here. This is the beauty of ADTs.

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

## What is FHIR?

[FHIR](https://www.hl7.org/fhir/overview.html) stands for Fast Healthcare Interoperability Resources. It is a standard describing data formats and elements known as "resources" and an application programming interface (API) for exchanging electronic health records (EHR). The standard was created by the Health Level Seven International (HL7) healthcare standards organization, and they own the trademark. 

## What is a FHIR Server?

A [FHIR server](https://build.fhir.org/http.html) is a server that implements the FHIR standard as HTTP REST. It is a server that can store and retrieve FHIR resources. There are several open-source and commercial implementations of the server, and there are [freely available test servers](https://confluence.hl7.org/display/FHIR/Public+Test+Servers). This tests and examples in this repo use the [HAPI test server](https://hapifhir.io/). 

## Is it on-prem? Or Cloud?

The FHIR server can be deployed on-prem or in the cloud. You can license a version of FHIR Server, or you can use an open-source implementation such as [Microsoft's .NET one](https://github.com/microsoft/fhir-server). 

All the major cloud providers have a FHIR server offering: 

- [Google Cloud Cloud Healthcare API](https://cloud.google.com/healthcare-api?hl=en) 
- [AWS HealthLake](https://aws.amazon.com/healthlake/), 
- [Azure Health Data Services](https://azure.microsoft.com/en-us/services/azure-api-for-fhir/)

Privacy and security are paramount in healthcare, so you should choose a provider that is compliant with the [Health Insurance Portability and Accountability Act (HIPAA)](https://www.hhs.gov/hipaa/index.html) and the [General Data Protection Regulation (GDPR)](https://gdpr.eu/). All the major providers offer compliance so there's no need to spend time and effort implementing your own health compliance. 

## Getting Started

Just install the `http` package and this one in the usual way. The library adds a bunch of extension methods to the `Client` class and that's it. For example, this example searches for PractitionerRole resources. Notice that using pattern matching with the [`switch` expression](https://www.christianfindlay.com/blog/dart-switch-expressions) is a great way to handle the two possible outcomes of the search because it supports pattern matching.

```dart
  final searchPractitionersResult =
      await client.searchPractitionerRoles(baseUri, count: 10);

  print('PractitionerRoles:');
  print(
    switch (searchPractitionersResult) {
      (final BundleEntries<PractitionerRole> be) => be.entries
          .map(
            (pr) => 'Id: ${pr.id}\nCodes:\n${pr.code?.map(
                  (cc) => cc.coding
                      ?.map(
                        (coding) => ' - '
                            '${coding.code} System: ${coding.system} '
                            '${coding.display}',
                      )
                      .join('\n'),
                ).join('\n')}',
          )
          .join('\n\n'),
      (final OperationOutcome<PractitionerRole> oo) =>
        'Error: ${oo.text!.status}\n${oo.text?.div}',
    },
  );
```

## Which Resources Are Supported?

Take a look at [this file](lib/models/resource.dart). You can see the resources that are currently implemented. The aim is to implement all of them in the long run. It's easy to implement them, so feel free to contribute by submitting a PR. Please make sure you cover the code with tests. There are some good existing [tests here](test/fhir_client_test.dart).
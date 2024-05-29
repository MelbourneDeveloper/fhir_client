import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import 'package:http/http.dart' as http;
import 'package:well_navigate/app_root.dart';
import 'package:well_navigate/query/query_notifier.dart';

void main() => runApp(
      CompositionRoot(
        child: const AppRoot(),
        compose: (b) => b
          ..addSingleton((container) => http.Client())
          ..addSingleton(
            (container) => QueryNotifier(client: container<http.Client>()),
          ),
      ),
    );

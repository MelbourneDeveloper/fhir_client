import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ioc_container/flutter_ioc_container.dart';
import 'package:well_navigate/app_root.dart';

void main() => runApp(
      CompositionRoot(
        child: const AppRoot(),
        compose: (b) {},
      ),
    );

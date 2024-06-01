import 'package:flutter/material.dart';

AppBar mainAppBar(
  String title,
  IconData icon,
  BuildContext context,
) =>
    AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );

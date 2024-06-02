import 'package:flutter/material.dart';

AppBar mainAppBar(
  String title,
  IconData icon,
  BuildContext context,
) =>
    AppBar(
      title: Stack(
        children: [
          if (Navigator.of(context).canPop())
            BackButton(
              onPressed: () => Navigator.of(context).pop(),
            ),
          Row(
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
        ],
      ),
    );

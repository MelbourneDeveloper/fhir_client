import 'package:flutter/material.dart';

AppBar mainAppBar(
  String title,
  IconData icon,
  BuildContext context,
) =>
    AppBar(
      title: Stack(
        children: [
          //Probly move this to the menu...
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
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ],
      ),
    );

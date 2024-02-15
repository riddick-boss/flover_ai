import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/assets/graphics.dart';
import '../../../domain/navigation/nav_route.dart';

class IntroDetailedExplanationScreen extends StatelessWidget {
  const IntroDetailedExplanationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 120.0,
                  horizontal: 82.0,
                ),
                child: SvgPicture.asset(
                  Graphics.introDetailedExplanationImage.path,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 36.0,
                right: 36.0,
                top: 21.0,
                bottom: 50.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dive deeper into\nthe world of florals',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  const SizedBox(
                    height: 36.0,
                  ),
                  Text(
                    'Learn more about each flower you discover and explore detailed information',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  const SizedBox(
                    height: 64.0,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          context.go(NavRoute.recognizer.path);
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Get started',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 24.0,
                            )
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 52.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

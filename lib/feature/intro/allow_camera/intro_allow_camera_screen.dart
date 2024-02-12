import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/assets/graphics.dart';

class IntroAllowCameraScreen extends StatelessWidget {
  const IntroAllowCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ColoredBox(
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
                    Graphics.introAllowCameraImage.path,
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
                    left: 36.0, right: 36.0, top: 21.0, bottom: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recognize flowers\nwith your camera',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                    ),
                    const SizedBox(
                      height: 36.0,
                    ),
                    Text(
                      'Enable camera access to discover flowers instantly with Flover AI',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                    const SizedBox(
                      height: 64.0,
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Allow permission',
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
      ),
    );
  }
}

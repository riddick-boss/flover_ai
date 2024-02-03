import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GrantCameraPermissionScreen extends StatelessWidget {
  const GrantCameraPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: Stack(
          children: [
            Positioned(
              child: Align(
                child: Text(
                  'In order to recognize flowers, app needs access to camera.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: FilledButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Click to allow camera usage'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

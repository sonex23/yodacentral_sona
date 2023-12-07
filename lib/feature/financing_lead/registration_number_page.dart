import 'package:flutter/material.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';

class RegistrationNumberPage extends StatelessWidget {
  const RegistrationNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_back_rounded,
                    color: Palette.primary700,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Home',
                    style: Theme.of(context).typography.black.displaySmall!.copyWith(
                          color: Palette.primary700,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Registration number*',
                style: Theme.of(context).typography.black.displayLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Please insert vehicle registration number.',
                style: Theme.of(context).typography.black.displaySmall!.copyWith(
                      color: Palette.gray500,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

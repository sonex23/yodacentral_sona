import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';
import 'package:yodacentral_sona/widget/primary_button.dart';

class RegistrationNumberDialog extends StatelessWidget {
  final String registrationNumber;
  const RegistrationNumberDialog({
    super.key,
    required this.registrationNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/warning_info.png',
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, false);
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                registrationNumber,
                style: Theme.of(context).typography.black.displayMedium,
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                  text: 'Make sure that the number you put in is correct, because it’ll be ',
                  style: Theme.of(context).typography.black.displaySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Palette.gray500,
                        height: 1.5,
                      ),
                  children: [
                    TextSpan(
                      text: 'unreplaceable',
                      style: Theme.of(context).typography.black.displaySmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Palette.error600,
                          ),
                    ),
                    TextSpan(
                      text: ' after you clicking the next button down below',
                      style: Theme.of(context).typography.black.displaySmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Palette.gray500,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              PrimaryButton(
                'Next',
                onTap: () {
                  Navigator.pop(context, true);
                },
              ),
              const SizedBox(
                height: 12,
              ),
              PrimaryButton(
                'Cancel',
                filled: false,
                onTap: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

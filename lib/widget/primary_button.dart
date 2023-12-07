import 'package:flutter/material.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';

class PrimaryButton extends StatelessWidget {
  final Widget? icon;
  final String text;
  final VoidCallback onTap;
  const PrimaryButton(
    this.text, {
    this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(color: Palette.primary600, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisSize: icon == null ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: icon != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            SizedBox(
              width: icon == null ? 0 : 8,
            ),
            Text(
              text,
              style: Theme.of(context).typography.black.displaySmall!.copyWith(
                    color: Colors.white,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

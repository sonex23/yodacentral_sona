import 'package:flutter/material.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';

class PrimaryButton extends StatelessWidget {
  final Widget? icon;
  final String text;
  final VoidCallback onTap;
  final bool? filled;
  const PrimaryButton(
    this.text, {
    this.icon,
    required this.onTap,
    this.filled = true,
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
        decoration: BoxDecoration(
          color: filled ?? false ? Palette.primary600 : Colors.transparent,
          border: Border.all(
            color: filled ?? false ? Colors.transparent : Palette.gray300,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
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
                    color: filled ?? false ? Colors.white : Palette.gray700,
                    fontSize: 16,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

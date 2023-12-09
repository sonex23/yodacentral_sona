import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';

class BackPageButton extends StatelessWidget {
  final String text;
  const BackPageButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Row(
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
            text,
            style: Theme.of(context).typography.black.displaySmall!.copyWith(
                  color: Palette.primary700,
                ),
          ),
        ],
      ),
    );
  }
}

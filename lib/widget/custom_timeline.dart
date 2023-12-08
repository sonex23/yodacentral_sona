import 'package:flutter/material.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';

class CustomTimeline extends StatelessWidget {
  final int progress;
  const CustomTimeline({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRowTimeline(
          context,
          step: 1,
          title: 'Registration number',
          body: 'Please insert vehicle registration number.',
        ),
        _buildRowTimeline(
          context,
          step: 2,
          title: 'Detail information',
          body: 'Please insert vehicle detail information.',
        ),
      ],
    );
  }

  Row _buildRowTimeline(
    BuildContext context, {
    required int step,
    required String title,
    required String body,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(step == progress ? 0 : 4),
              child: Image.asset(
                step == progress
                    ? 'assets/images/step_active.png'
                    : step < progress
                        ? 'assets/images/step_done.png'
                        : 'assets/images/step_disable.png',
              ),
            ),
            Container(
              width: 2,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: step < progress ? Palette.primary600 : Palette.gray200,
              ),
            )
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6,
              ),
              Text(
                title,
                style: Theme.of(context).typography.black.displaySmall!.copyWith(
                      color: Palette.primary700,
                    ),
              ),
              Text(
                body,
                style: Theme.of(context).typography.black.displaySmall!.copyWith(
                      color: Palette.primary600,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

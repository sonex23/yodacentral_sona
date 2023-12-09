import 'package:flutter/material.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';

class InputDropdownBottomSheet extends StatefulWidget {
  final String title;
  final String? value;
  final Function()? onTap;
  final String? errorMessage;
  const InputDropdownBottomSheet({
    Key? key,
    required this.title,
    this.onTap,
    this.value,
    this.errorMessage,
  }) : super(key: key);

  @override
  State<InputDropdownBottomSheet> createState() => _InputDropdownBottomSheetState();
}

class _InputDropdownBottomSheetState extends State<InputDropdownBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).typography.black.displaySmall!.copyWith(
                color: Palette.gray700,
              ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Palette.gray300),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 1),
                  color: Palette.gray900.withOpacity(0.05),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.value ?? '',
                    style: Theme.of(context).typography.black.displaySmall!.copyWith(
                          color: Palette.gray900,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Palette.gray500,
                )
              ],
            ),
          ),
          onTap: () {
            widget.onTap?.call();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 14,
            left: 16,
          ),
          child: widget.errorMessage != null
              ? Text(
                  widget.errorMessage!,
                  style: Theme.of(context).typography.black.displaySmall!.copyWith(
                        color: Palette.error600,
                      ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

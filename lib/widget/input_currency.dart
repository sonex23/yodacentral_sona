import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';

class InputCurrency extends StatefulWidget {
  final TextEditingController textController;
  final TextEditingController errorController;

  final String title;
  const InputCurrency({
    required this.title,
    required this.textController,
    required this.errorController,
    super.key,
  });

  @override
  State<InputCurrency> createState() => _InputCurrencyState();
}

class _InputCurrencyState extends State<InputCurrency> {
  String inputtedBill = '';
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
        const SizedBox(
          height: 6,
        ),
        Container(
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
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 12,
                  bottom: 10,
                  left: 14,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Palette.gray300,
                    ),
                  ),
                ),
                child: Text(
                  'Rp',
                  style: Theme.of(context).typography.black.displaySmall!.copyWith(
                        color: Palette.gray500,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: widget.textController,
                  style: Theme.of(context).typography.black.displaySmall!.copyWith(
                        fontSize: 16,
                      ),
                  onChanged: (s) {
                    setState(() {
                      inputtedBill = s;
                    });
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(14),
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      try {
                        String newString = newValue.text;
                        final text = newValue.text;
                        final int selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;
                        if (text.isNotEmpty) {
                          double newDouble = double.parse(text);
                          newString = NumberFormat("#,###", "en").format(newDouble);
                        }
                        return TextEditingValue(
                          text: newString,
                          selection: TextSelection.collapsed(offset: newString.length - selectionIndexFromTheRight),
                        );
                      } catch (e) {}
                      return oldValue;
                    }),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        widget.errorController.text.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 14,
                  left: 16,
                ),
                child: Text(
                  widget.errorController.text,
                  style: Theme.of(context).typography.black.displaySmall!.copyWith(
                        color: Palette.error600,
                      ),
                ),
              )
            : const SizedBox(
                height: 16,
              ),
      ],
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';
import 'package:yodacentral_sona/misc/utils/router_constant.dart';
import 'package:yodacentral_sona/widget/custom_timeline.dart';
import 'package:yodacentral_sona/widget/primary_button.dart';

class RegistrationNumberPage extends StatefulWidget {
  const RegistrationNumberPage({super.key});

  @override
  State<RegistrationNumberPage> createState() => _RegistrationNumberPageState();
}

class _RegistrationNumberPageState extends State<RegistrationNumberPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _registrationNumberController = TextEditingController();

  Future<void> _showMyDialog(String registrationNumber) async {
    final bool? result = await showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
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
      },
    );
    if (result ?? false) {
      context.pushNamed(specificationRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
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
                          'Home',
                          style: Theme.of(context).typography.black.displaySmall!.copyWith(
                                color: Palette.primary700,
                              ),
                        ),
                      ],
                    ),
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
                  const SizedBox(
                    height: 32,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _registrationNumberController,
                      validator: (value) {
                        String pattern = r'^[A-Z]{1,2}\s{1}\d{0,4}\s{0,1}[A-Z]{0,3}$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value ?? '')) {
                          return 'Enter Valid Registration Number';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Palette.primary600,
                      style: Theme.of(context).typography.black.displaySmall!.copyWith(
                            fontSize: 16,
                          ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Palette.primary600,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Palette.gray300,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 190, 13, 0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 190, 13, 0),
                          ),
                        ),
                        hintText: 'BL 1234 AA',
                        hintStyle: Theme.of(context).typography.black.displaySmall!.copyWith(
                              fontSize: 16,
                              color: Palette.gray300,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PrimaryButton(
                    'Next',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _showMyDialog(_registrationNumberController.text);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  const CustomTimeline(
                    progress: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

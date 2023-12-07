import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';
import 'package:yodacentral_sona/widget/primary_button.dart';

class RegistrationNumberPage extends StatefulWidget {
  const RegistrationNumberPage({super.key});

  @override
  State<RegistrationNumberPage> createState() => _RegistrationNumberPageState();
}

class _RegistrationNumberPageState extends State<RegistrationNumberPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              const SizedBox(
                height: 32,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
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
                  }
                },
              ),
              const SizedBox(
                height: 64,
              ),
              CustomTimeline()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTimeline extends StatelessWidget {
  const CustomTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}

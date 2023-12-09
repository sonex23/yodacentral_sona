import 'package:flutter/material.dart';
import 'package:yodacentral_sona/misc/utils/palette.dart';
import 'package:yodacentral_sona/widget/back_page_button.dart';
import 'package:yodacentral_sona/widget/custom_timeline.dart';
import 'package:yodacentral_sona/widget/input_dropdown_bottomsheet.dart';

class SpecificationPage extends StatefulWidget {
  const SpecificationPage({super.key});

  @override
  State<SpecificationPage> createState() => _SpecificationPageState();
}

class _SpecificationPageState extends State<SpecificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _conditionTextController = TextEditingController();
  final TextEditingController _conditionErrorController = TextEditingController();
  final TextEditingController _brandTextController = TextEditingController();
  final TextEditingController _brandErrorController = TextEditingController();
  final TextEditingController _modelTextController = TextEditingController();
  final TextEditingController _modelErrorController = TextEditingController();
  final TextEditingController _variantTextController = TextEditingController();
  final TextEditingController _variantErrorController = TextEditingController();
  final TextEditingController _manufactureTextController = TextEditingController();
  final TextEditingController _manufactureErrorController = TextEditingController();
  final TextEditingController _mileageTextController = TextEditingController();
  final TextEditingController _mileageErrorController = TextEditingController();
  final TextEditingController _fuelTextController = TextEditingController();
  final TextEditingController _fuelErrorController = TextEditingController();
  final TextEditingController _transmissionTextController = TextEditingController();
  final TextEditingController _transmissionErrorController = TextEditingController();
  final TextEditingController _exteriorTextController = TextEditingController();
  final TextEditingController _exteriorErrorController = TextEditingController();

  void showInputBottomSheet(
    List<String> listValue,
    StateSetter setNewState, {
    required TextEditingController textController,
    required TextEditingController errorController,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext dialogContext) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 4,
                  width: 48,
                  color: Palette.gray500,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Expanded(
                  child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: Text(
                          listValue[index],
                          style: Theme.of(context).typography.black.displaySmall,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(dialogContext);
                      FocusScope.of(dialogContext).unfocus();
                      setNewState(() {
                        errorController.text = '';
                        textController.text = listValue[index];
                        //_propertyOwnerOtherController.clear();
                      });
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  height: 1,
                  color: Palette.gray300,
                ),
                itemCount: listValue.length,
              ))
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StatefulBuilder(builder: (context, setNewState) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: ListView(
              children: [
                const BackPageButton(
                  text: 'Registration number',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Specification',
                  style: Theme.of(context).typography.black.displayLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Vehicle details will be submitted on Yodamobi. Please fill in required information',
                  style: Theme.of(context).typography.black.displaySmall!.copyWith(
                        color: Palette.gray500,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(
                  height: 21,
                ),
                const Divider(
                  color: Palette.gray200,
                  height: 1,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 32,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      InputDropdownBottomSheet(
                        title: 'Condition*',
                        value: _conditionTextController.text,
                        errorMessage: _conditionErrorController.text,
                        onTap: () {
                          showInputBottomSheet(
                            [
                              'Bekas',
                              'Baru',
                            ],
                            setNewState,
                            textController: _conditionTextController,
                            errorController: _conditionErrorController,
                          );
                        },
                      ),
                      InputDropdownBottomSheet(
                        title: 'Brand*',
                        value: _brandTextController.text,
                        errorMessage: _brandErrorController.text,
                        onTap: () {
                          showInputBottomSheet(
                            [
                              'Mitsubishi',
                              'Isuzu',
                              'Suzuki',
                            ],
                            setNewState,
                            textController: _brandTextController,
                            errorController: _brandErrorController,
                          );
                        },
                      ),
                      InputDropdownBottomSheet(
                        title: 'Model*',
                        value: _modelTextController.text,
                        errorMessage: _modelErrorController.text,
                        onTap: () {
                          showInputBottomSheet(
                            [
                              'Colt',
                              'Panther',
                              'Futura',
                            ],
                            setNewState,
                            textController: _modelTextController,
                            errorController: _modelErrorController,
                          );
                        },
                      ),
                      InputDropdownBottomSheet(
                        title: 'Variant*',
                        value: _variantTextController.text,
                        errorMessage: _variantErrorController.text,
                        onTap: () {
                          showInputBottomSheet(
                            [
                              '3.9 FE 71 Solar',
                              '3.9 FE 73 Solar',
                              '3.9 FE 74 Solar',
                              '3.9 FE 84G Solar',
                            ],
                            setNewState,
                            textController: _variantTextController,
                            errorController: _variantErrorController,
                          );
                        },
                      ),
                      InputDropdownBottomSheet(
                        title: 'Manufacture year*',
                        value: _manufactureTextController.text,
                        errorMessage: _manufactureErrorController.text,
                        onTap: () {
                          List<String> listTahun = [];
                          for (int tahun = 2000; tahun <= DateTime.now().year; tahun++) {
                            listTahun.add(tahun.toString());
                          }
                          showInputBottomSheet(
                            listTahun,
                            setNewState,
                            textController: _manufactureTextController,
                            errorController: _manufactureErrorController,
                          );
                        },
                      ),
                      InputDropdownBottomSheet(
                        title: 'Mileage*',
                        value: _mileageTextController.text,
                        errorMessage: _mileageErrorController.text,
                        onTap: () {
                          showInputBottomSheet(
                            [
                              '0 - 10000',
                              '10000 - 25000',
                              '25000 - 30000',
                              '> 30000',
                            ],
                            setNewState,
                            textController: _mileageTextController,
                            errorController: _mileageErrorController,
                          );
                        },
                      ),
                      InputDropdownBottomSheet(
                        title: 'Fuel type*',
                        value: _fuelTextController.text,
                        errorMessage: _fuelErrorController.text,
                        onTap: () {
                          showInputBottomSheet(
                            [
                              'Diesel',
                              'Premium',
                              'Petrol',
                              'Bio Diesel',
                            ],
                            setNewState,
                            textController: _fuelTextController,
                            errorController: _fuelErrorController,
                          );
                        },
                      ),
                      InputDropdownBottomSheet(
                        title: 'Transmission*',
                        value: _transmissionTextController.text,
                        errorMessage: _transmissionErrorController.text,
                        onTap: () {
                          showInputBottomSheet(
                            [
                              'Auto',
                              'Manual',
                            ],
                            setNewState,
                            textController: _transmissionTextController,
                            errorController: _transmissionErrorController,
                          );
                        },
                      ),
                      InputDropdownBottomSheet(
                        title: 'Exterior color*',
                        value: _exteriorTextController.text,
                        errorMessage: _exteriorErrorController.text,
                        onTap: () {
                          showInputBottomSheet(
                            [
                              'Merah',
                              'Kuning',
                              'Hijau',
                              'Biru',
                              'Putih',
                              'Hitam',
                            ],
                            setNewState,
                            textController: _exteriorTextController,
                            errorController: _exteriorErrorController,
                          );
                        },
                      ),
                      const CustomTimeline(progress: 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

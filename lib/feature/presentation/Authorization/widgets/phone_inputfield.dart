// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:happycar/controller/autherization_controller.dart';

// ignore: must_be_immutable
class PhoneInputField extends StatefulWidget {
  final Function(String, String, String) callBackFunction;

  bool isInit;
  final Color? color;
  final AutherizationController controller;
  PhoneInputField({
    super.key,
    this.color,
    required this.callBackFunction,
    this.isInit = true,
    required this.controller,
  });

  @override
  State<PhoneInputField> createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);

    // Add listener to mobileController
    widget.controller.mobileController.addListener(() {
      setState(() {}); // Trigger UI rebuild when text changes
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    widget.controller.mobileController.removeListener(() {}); // Remove listener
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  List<CountryModel> countryList = [];
  CountryModel? selectedCountryData;

  @override
  void didChangeDependencies() async {
    if (widget.isInit) {
      widget.isInit = false;
      final data = await DefaultAssetBundle.of(context)
          .loadString('assets/fonts/countrycode.json');
      setState(() {
        countryList = parseJson(data);
        selectedCountryData = countryList[0];
      });
      widget.callBackFunction(selectedCountryData!.name,
          selectedCountryData!.dialCode, selectedCountryData!.flag);
    }
    super.didChangeDependencies();
  }

  List<CountryModel> parseJson(String response) {
    // ignore: unnecessary_null_comparison
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed
        .map<CountryModel>(
            (json) => CountryModel.fromJson(json as Map<String, dynamic>))
        .toList() as List<CountryModel>;
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      color: Colors.white,
      radius: 10,
      child: TextFormField(
        maxLength: 10,
        controller: widget.controller.mobileController,
        focusNode: _focusNode,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          counterText: '',
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          border: InputBorder.none,
          filled: false,
          hintText: 'Enter phone number',
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF000000),
              width: 0.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xFF000000),
              width: 0.2,
            ),
          ),
          suffixIcon: widget.controller.mobileController.text.isNotEmpty
              ? InkWell(
                  onTap: () {
                    widget.controller.mobileController.clear();
                    setState(() {}); // Ensure UI updates after clearing
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: Colors.black38,
                    size: 20,
                  ),
                )
              : null,
          prefixIcon: Container(
            height: 50,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(10))),
            child: InkResponse(
              onTap: () {
                showDialogue(context);
              },
              child: SizedBox(
                width: 90,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedCountryData != null
                          ? selectedCountryData!.flag
                          : '',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      selectedCountryData != null
                          ? selectedCountryData!.dialCode
                          : '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: VerticalDivider(
                        color: Colors.black38,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showDialogue(BuildContext context) async {
    final countryData = await showDialog(
      context: context,
      builder: (BuildContext context) => CountryPickerDialog(
        searchList: countryList,
        callBackFunction: widget.callBackFunction,
      ),
    );
    if (mounted && countryData != null) {
      selectedCountryData = countryData as CountryModel;
      setState(() {});
    }
  }
}

class CountryModel {
  const CountryModel(
      {required this.name,
      required this.dialCode,
      required this.code,
      required this.flag});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    final flag = CountryModel.getEmojiFlag(json['code'] as String);
    return CountryModel(
        name: json['name'] as String,
        dialCode: json['dial_code'] as String,
        code: json['code'] as String,
        flag: flag);
  }

  final String name, dialCode, code, flag;

  static String getEmojiFlag(String emojiString) {
    const flagOffset = 0x1F1E6;
    const asciiOffset = 0x41;
    final firstChar = emojiString.codeUnitAt(0) - asciiOffset + flagOffset;
    final secondChar = emojiString.codeUnitAt(1) - asciiOffset + flagOffset;
    return String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
  }
}

class CountryPickerDialog extends StatefulWidget {
  final List<CountryModel> searchList;
  final Function callBackFunction;

  const CountryPickerDialog({
    super.key,
    required this.searchList,
    required this.callBackFunction,
  });

  @override
  _CountryPickerDialogState createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  List<CountryModel> tmpList = [];

  Widget dialogContent(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                color: Color(0xFF222222),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select Country',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkResponse(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: 'Search Country',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 18.0,
                    color: Colors.black38,
                  )),
              onChanged: filterData,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...tmpList.map(
                    (item) => GestureDetector(
                      onTap: () {
                        Navigator.pop(context, item);
                        widget.callBackFunction(
                          item.name,
                          item.dialCode,
                          item.flag,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.flag,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Text(
                                item.name,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              item.dialCode,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void filterData(String text) {
    tmpList = [];
    if (text == '') {
      tmpList.addAll(widget.searchList);
    } else {
      for (var userDetail in widget.searchList) {
        if (userDetail.name.toLowerCase().contains(text.toLowerCase())) {
          tmpList.add(userDetail);
        }
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    tmpList = widget.searchList;
  }

  // build method
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: [
          BoxShadow(
            color: color!,
          ),
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: color!,
          ),
        ],
      ),
      child: child,
    );
  }
}

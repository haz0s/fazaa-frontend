// ignore_for_file: deprecated_member_use
import 'package:fazaa/core/utils/constats.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneFieldWidget extends StatefulWidget {
  const PhoneFieldWidget({super.key, required this.controller, this.hintText});
  final PhoneController controller;
  final String? hintText;
  @override
  State<PhoneFieldWidget> createState() => _PhoneFieldWidgetState();
}

class _PhoneFieldWidgetState extends State<PhoneFieldWidget> {
  final FocusNode fNode = FocusNode();
  bool isFill = true;
  Color fillColor = const Color(0xffF4F7FE);

  @override
  void initState() {
    fNode.addListener(() {
      if (fNode.hasFocus) {
        setState(() {
          fillColor = Colors.white;
          isFill = false;
        });
      } else {
        setState(() {
          fillColor = const Color(0xffF4F7FE);
          isFill = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: PhoneFormField(
          controller: widget.controller,
          focusNode: fNode,
          countryButtonStyle: const CountryButtonStyle(
            showDialCode: true,
            showIsoCode: true,
            showFlag: false,
          ),
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kBorderRadius),
                borderSide: BorderSide.none),
          ),
          validator: PhoneValidator.compose([
            PhoneValidator.required(context, errorText: "رقم الهاتف مطلوب"),
            PhoneValidator.validMobile(context, errorText: "رقم هاتف غير صالح"),
          ]),
          onChanged: (phoneNumber) => print(
              "+${widget.controller.value.countryCode}${widget.controller.value.nsn}"),
        ),
      ),
    );
  }
}

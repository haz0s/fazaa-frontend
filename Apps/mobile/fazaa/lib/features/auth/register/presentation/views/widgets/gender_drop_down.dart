import 'package:flutter/material.dart';

import '../../../../../../core/utils/constats.dart';

class GenderDropDown extends StatefulWidget {
  const GenderDropDown({super.key, required this.genderConttroller});
  final TextEditingController genderConttroller;
  @override
  State<GenderDropDown> createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: "الجنس",
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: const Color(0xffF4F7FE),
        ),
        value: widget.genderConttroller.text,
        items: const [
          DropdownMenuItem(value: "male", child: Text("ذكر")),
          DropdownMenuItem(value: "female", child: Text("أنثى")),
        ],
        onChanged: (value) =>
            setState(() => widget.genderConttroller.text = value!),
        validator: (value) => value == null ? "يجب اختيار الجنس" : null,
      ),
    );
  }
}

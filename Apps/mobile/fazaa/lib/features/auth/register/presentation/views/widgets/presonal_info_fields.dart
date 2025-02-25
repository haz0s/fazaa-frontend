import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/utils/validation.dart';
import '../../../../login/presentation/views/widgets/phone_field_widget.dart';
import '../../../../widgets/ccustom_text_filed.dart';

class PresonalInfoFields extends StatelessWidget {
  const PresonalInfoFields({
    super.key,
    required TextEditingController nameController,
    required TextEditingController nationalIdController,
    required PhoneController phoneController,
    required TextEditingController addressController,
  })  : _nameController = nameController,
        _nationalIdController = nationalIdController,
        _phoneController = phoneController,
        _addressController = addressController;

  final TextEditingController _nameController;
  final TextEditingController _nationalIdController;
  final PhoneController _phoneController;
  final TextEditingController _addressController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          text: "الاسم الكامل",
          isPassword: false,
          controller: _nameController,
          validatorFun: (value) =>
              Validator.validate(value, ValidationState.normal),
        ),
        CustomTextField(
          text: "الرقم الوطني",
          isPassword: false,
          controller: _nationalIdController,
          keyboardType: TextInputType.number,
          validatorFun: (value) =>
              Validator.validate(value, ValidationState.normal),
        ),
        PhoneFieldWidget(
          controller: _phoneController,
          hintText: "رقم الهاتف",
        ),
        CustomTextField(
          text: "العنوان",
          isPassword: false,
          maxLine: 3,
          controller: _addressController,
          validatorFun: (value) =>
              Validator.validate(value, ValidationState.normal),
        ),
      ],
    );
  }
}

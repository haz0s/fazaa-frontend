import 'package:fazaa/core/utils/colors.dart';
import 'package:fazaa/core/utils/constats.dart';
import 'package:fazaa/core/widgets/custom_button.dart';
import 'package:fazaa/features/auth/login/presentation/views/number_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import 'widgets/presonal_info_fields.dart';

class CustomerRegisterPage extends StatefulWidget {
  const CustomerRegisterPage({super.key});
  static const String routeName = "customerRegister";

  @override
  State<CustomerRegisterPage> createState() => _CustomerRegisterPageState();
}

class _CustomerRegisterPageState extends State<CustomerRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final PhoneController _phoneController = PhoneController(
      initialValue: const PhoneNumber(isoCode: IsoCode.SY, nsn: ""));
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomAppBar(title: "أنشاء الحساب", back_btn: true),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: kSizedBoxHeight),
                      PresonalInfoFields(
                        addressController: _addressController,
                        nameController: _nameController,
                        nationalIdController: _nationalIdController,
                        phoneController: _phoneController,
                      ),
                      _buildGenderDropdown(),
                      const SizedBox(height: kSizedBoxHeight),
                      _buildSubmitButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
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
          value: _selectedGender,
          items: const [
            DropdownMenuItem(value: "male", child: Text("ذكر")),
            DropdownMenuItem(value: "female", child: Text("أنثى")),
          ],
          onChanged: (value) => setState(() => _selectedGender = value),
          validator: (value) => value == null ? "يجب اختيار الجنس" : null,
        ));
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CustomButton(
        text: "تسجيل",
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => NumberVerificationPage(
                        phoneNumber: _phoneController.value.nsn)));
          }
        },
        verticalHieght: 16,
        horizontalWidth: 0,
        color: AppColors.primary,
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter $label";
          }
          return null;
        },
        obscuringCharacter: "*",
        obscureText: label == "Password" ? true : false,
        keyboardType:
            label == "PhoneNumber" ? TextInputType.phone : TextInputType.text,
        style: const TextStyle(color: Colors.black, fontSize: 14),
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 148, 176, 198),
              width: 2,
            ),
          ),
          suffixIcon: label == "Password"
              ? IconButton(
                  onPressed: () {
                    //TODO : add functionality
                  },
                  icon: const Icon(
                    Icons.visibility,
                  ),
                )
              : const SizedBox.shrink(),
          prefixIcon: label == "PhoneNumber"
              ? const Icon(
                  Icons.phone_android_rounded,
                )
              : const Icon(
                  Icons.lock,
                ),
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}

import 'package:cityfood/colorsConstrain/colorsHex.dart';
import 'package:flutter/material.dart';

Widget textFiled(
    {label,
    hintText,
    err,
    controller2,
    suffixIcon2,
    keyboardType4,
    validate,
    onchange,
    keys,
    obscureText = false}) {
  return Form(
    key: keys,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: GlobalColors.orange),
        ),
        const SizedBox(height: 5),
        TextFormField(
          onChanged: onchange,
          validator: validate,
          controller: controller2,
          keyboardType: keyboardType4,
          obscureText: obscureText,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              suffixIcon: suffixIcon2,
              errorText: err,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white),
              helperStyle: TextStyle(
                  color: GlobalColors.orange,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: GlobalColors.orange),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black54),
                  borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

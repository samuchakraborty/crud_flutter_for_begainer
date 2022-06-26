import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
        this.controller,
         this.labelName,
        this.hintTextName,
        this.onChangedFunction,
        required this.textInputType,
        this.onPressed,
        this.icon,
        required this.readOnly,
        this.maxValue,
        this.validator,
        this.textInputAction,
        this.isTrue,
        this.suffixIcon,
        this.obscureTextTy = false,
         this.hintTextStyle,
        this.prefixIcon,
        this.initialValue})
      : super(key: key);

  final String? labelName;
  final String? hintTextName;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final bool? isTrue;
  final String? initialValue;
  final ValueChanged? onChangedFunction;
  final bool readOnly;
  final Function()? onPressed;

  final FormFieldValidator<String>? validator;
  final IconData? icon;
  final int? maxValue;
  final bool obscureTextTy;
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? hintTextStyle;

  @override
  Widget build(BuildContext context) {
      return Column(
//              mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(labelName != null)
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              labelName!,
              style:  const TextStyle(
                 fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: Color(0XFF000000
                  ),
                  fontSize: 16),
            ),
          ),
          if(labelName != null)
          SizedBox(height: 10,),
          TextFormField(
            initialValue: initialValue,
            readOnly: readOnly,
            controller: controller,
            validator: validator,
            keyboardType: textInputType,
            style:  const TextStyle(fontSize: 16),
            // autofocus: true,
            textInputAction: textInputAction,
            inputFormatters: [LengthLimitingTextInputFormatter(maxValue)],
            decoration: InputDecoration(
              hintStyle:  hintTextStyle,
              hintText: hintTextName,
              enabledBorder:  const OutlineInputBorder(
               borderSide: BorderSide(color: Color(0XFF008542)),
                borderRadius: BorderRadius.all(Radius.circular(10))

              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF008542)),
                  borderRadius: BorderRadius.all(Radius.circular(10))

              ),
              //isDense: true,                      // Added this
              //  contentPadding: EdgeInsets.all(15),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
            autofocus: false,
            onChanged: onChangedFunction,
            obscureText: obscureTextTy,
          ),
        ],
      );

  }
}

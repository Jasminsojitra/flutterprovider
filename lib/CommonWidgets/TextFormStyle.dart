import 'package:flutter/material.dart';

class FormTextStyle extends StatelessWidget {
  const FormTextStyle(
      {
        required this.focus,
        required this.controller,
        this.hint,
        this.dark,
        this.prefixIcon,
        this.suffixIcon,
        this.iconTap,
        this.protected,
        this.onSubmit,
        this.inputType,
        this.errorText});

  final FocusNode focus;
  final bool? dark;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? hint;
  final Function? iconTap;
  final bool? protected;
  final Function(String value)? onSubmit;
  final TextInputType? inputType;
  final String? errorText;
  //final Function()

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextField(
        obscureText: protected ?? false,
        controller: this.controller,
        keyboardType: inputType ?? TextInputType.text,
        autofocus: false,
        onSubmitted: (v) {
          FocusScope.of(context).requestFocus(focus);
          if (onSubmit != null) onSubmit!(v);
        },
        decoration: InputDecoration(
            errorText: this.errorText,
            prefixIcon: getInputPrefix(context),
            suffixIcon: getSuffixIcon(context),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),),
            hintText: hint),
      ),
    );
  }

  Widget? getInputPrefix(BuildContext context) {
    if (prefixIcon != null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          this.prefixIcon,
          size: 24,
        ),
      );
    } else {
      return null;
    }
  }

  Widget? getSuffixIcon(BuildContext context) {
    print('suffixIcon ${suffixIcon}');
    if (suffixIcon != null) {
      return IconButton(
        onPressed: () {
          if (this.iconTap != null) this.iconTap!();
        },
        icon: Icon(suffixIcon),
        color: Theme.of(context).iconTheme.color,
      );
    } else {
      return null;
    }
  }
}

Widget validatePaymentCard(Color bgColor,IconData cardIcon){
  return Card(
    color: bgColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
      padding: EdgeInsets.all(5),
      child: Icon(cardIcon,color: Colors.white,size: 15,),
    ),
  );
}
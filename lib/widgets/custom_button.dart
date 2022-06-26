import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.onPressed,  this.buttonName,
        this.child ,this.icons, this.style})
      : super(key: key);
  final Function() onPressed;
  final String? buttonName;
  final IconData? icons;
  final Widget? child;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child?? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(icons != null)
            Icon(
              icons,
              size: 30,
            ),

          if (icons != null)
            const SizedBox(
              width: 6,
            ),
          Text(
            buttonName!,
            style: const TextStyle(fontSize: 24,),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonIcon;
  const CustomButton(
      {super.key, required this.onTap, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(213, 221, 211, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        height: 20,
        width: 20,
        child: Center(
          child: SvgPicture.asset(
            buttonIcon,
            height: 13,
            width: 13,
          ),
        ),
      ),
    );
  }
}

class CustomMainButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  const CustomMainButton(
      {super.key, required this.buttonText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 350,
        height: 75,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(45, 85, 35, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white,fontSize: 18,fontFamily: "Poppins"),
          ),
        ),
      ),
    );
  }
}

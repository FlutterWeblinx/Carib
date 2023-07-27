import 'package:flutter/material.dart';

class SmallThemeButton extends StatelessWidget {
  final String title;
  final void Function()? ontap;
  const SmallThemeButton({
    Key? key,
    required this.title,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 24, 24, 24),
                Color.fromARGB(255, 128, 183, 56),
              ])),
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: FittedBox(child: Text(title)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:app_le_bon_francais/pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.buttonName,

  }) : super(key: key);

  final String? buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.darkblue,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          buttonName!,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
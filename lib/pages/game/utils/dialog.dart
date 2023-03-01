import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

abstract class Ballon {
  static Say sayBallon({
    required String text,
    String? decorationText,
    Color? decorationColor,
    Widget? person,
  }) {
    return Say(
      text: [
        TextSpan(
          text: text,
        ),
        if (decorationText != null)
          TextSpan(
            text: decorationText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: decorationColor,
            ),
          ),
      ],
      person: SizedBox(
        width: 100,
        height: 100,
        child: person,
      ),
      personSayDirection: PersonSayDirection.RIGHT,
    );
  }
}

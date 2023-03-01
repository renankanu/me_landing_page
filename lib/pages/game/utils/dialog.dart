import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

abstract class Ballon {
  static Say sayBallon({
    required List<TextSpan> messages,
    Widget? person,
  }) {
    return Say(
      text: messages,
      person: SizedBox(
        width: 100,
        height: 100,
        child: person,
      ),
      personSayDirection: PersonSayDirection.RIGHT,
    );
  }
}

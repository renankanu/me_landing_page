import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bar_life_component.dart';

class MyPlayerInterface extends GameInterface {
  @override
  void onMount() {
    add(BarLifeInterface());
    add(
      TextInterfaceComponent(
          id: 2,
          text: 'Bentley',
          textConfig: GoogleFonts.vt323(
            color: Colors.white,
            fontSize: 20,
          ),
          position: Vector2(150, 20)),
    );
    super.onMount();
  }
}

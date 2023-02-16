import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatefulWidget {
  const SocialButton({
    Key? key,
    required this.buttonColor,
    required this.shadowColor,
    required this.name,
    required this.icon,
  }) : super(key: key);

  final Color buttonColor;
  final Color shadowColor;
  final String name;
  final String icon;

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  late Color _hoverColor;

  @override
  void initState() {
    _hoverColor = widget.buttonColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        setState(() {
          _hoverColor = widget.buttonColor.withOpacity(0.8);
        });
      },
      onExit: (event) {
        setState(() {
          _hoverColor = widget.buttonColor;
        });
      },
      child: GestureDetector(
        child: Container(
          width: 206,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: widget.shadowColor,
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
            color: _hoverColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.name,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(width: 20),
              SvgPicture.asset(
                widget.icon,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                height: 32,
                width: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

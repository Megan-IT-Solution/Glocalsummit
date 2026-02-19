import 'package:bni_event/theme/colors.dart';
import 'package:flutter/material.dart';

class NavbarButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color? btnColor;
  final VoidCallback? onPressed;

  const NavbarButton({
    super.key,
    required this.title,
    required this.icon,
    this.btnColor,
    this.onPressed,
  });

  @override
  State<NavbarButton> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: GestureDetector(
        onTap: widget.onPressed ?? () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: _isHover
                ? (widget.btnColor ?? AppColors.accent1).withValues(alpha: 0.8)
                : widget.btnColor ?? AppColors.accent1,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _isHover
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

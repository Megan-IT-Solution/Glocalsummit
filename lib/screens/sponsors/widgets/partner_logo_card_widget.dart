import 'package:bni_event/models/sponsor_model.dart';
import 'package:bni_event/theme/colors.dart';
import 'package:flutter/material.dart';

class PartnerLogoCardWidget extends StatefulWidget {
  final SponsorModel sponsor;
  final bool isMobile;
  final bool isPremium;
  final double? customWidth;
  final double? customHeight;

  const PartnerLogoCardWidget({
    super.key,
    required this.sponsor,
    required this.isMobile,
    required this.isPremium,
    this.customWidth,
    this.customHeight,
  });

  @override
  State<PartnerLogoCardWidget> createState() => _PartnerLogoCardWidgetState();
}

class _PartnerLogoCardWidgetState extends State<PartnerLogoCardWidget>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHover(bool hovered) {
    setState(() {
      isHovered = hovered;
      if (isHovered) {
        _animationController.repeat();
      } else {
        _animationController.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Stack(
        children: [
          if (isHovered)
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _BorderTracerPainter(
                      progress: _animationController.value,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              width: widget.customWidth ?? (widget.isMobile ? 180 : 240),
              height: widget.customHeight ?? (widget.isMobile ? 260 : 300),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black.withValues(alpha: 0.15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.07),
                    blurRadius: 5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Center(
                        child: AnimatedScale(
                          scale: isHovered ? 1.1 : 1.0,
                          duration: const Duration(milliseconds: 300),
                          child: widget.sponsor.logoUrl.isEmpty
                              ? Text(
                                  widget.sponsor.name,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: widget.isMobile ? 18 : 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : widget.sponsor.logoUrl.startsWith('http')
                              ? Image.network(
                                  widget.sponsor.logoUrl,
                                  fit: BoxFit.contain,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return const Center(
                                          child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          ),
                                        );
                                      },
                                )
                              : Image.asset(
                                  widget.sponsor.logoUrl,
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: const BoxDecoration(color: AppColors.primary),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.sponsor.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          // textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.sponsor.description,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 11,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BorderTracerPainter extends CustomPainter {
  final double progress;
  final Color color;

  _BorderTracerPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(20));
    final path = Path()..addRRect(rRect);

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 1);

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      final totalLength = metric.length;
      final sweep = totalLength * 0.4;

      void drawSegment(double offset) {
        final start = (totalLength * (progress + offset)) % totalLength;
        if (start + sweep < totalLength) {
          canvas.drawPath(metric.extractPath(start, start + sweep), paint);
        } else {
          canvas.drawPath(metric.extractPath(start, totalLength), paint);
          canvas.drawPath(
            metric.extractPath(0, sweep - (totalLength - start)),
            paint,
          );
        }
      }

      drawSegment(0.0);
      drawSegment(0.5);
    }
  }

  @override
  bool shouldRepaint(covariant _BorderTracerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

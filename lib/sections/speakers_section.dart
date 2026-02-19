import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/responsive_helper.dart';
import '../utils/dimensions.dart';

class SpeakerSection extends StatelessWidget {
  const SpeakerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final crossAxisCount = isMobile ? 1 : (isTablet ? 3 : 5);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      padding: Dimensions.getSectionPadding(context),
      child: Column(
        children: [
          Text(
            'Meet our 2026 speakers',
            style: TextStyle(
              fontSize: isMobile ? 28 : (isTablet ? 34 : 40),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isMobile ? 30 : 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? 15 : 25,
              mainAxisSpacing: isMobile ? 15 : 25,
              childAspectRatio: isMobile ? 1.2 : 0.75,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              final images = [
                'https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?auto=format&fit=crop&q=80&w=600',
                'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&q=80&w=600',
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=600',
                'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&q=80&w=600',
                'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=600',
              ];
              return SpeakerCard(
                name: 'Speaker Name',
                position: 'Position @ Company',
                imageUrl: images[index % images.length],
              );
            },
          ),
        ],
      ),
    );
  }
}

class SpeakerCard extends StatefulWidget {
  final String name;
  final String position;
  final String imageUrl;

  const SpeakerCard({
    super.key,
    required this.name,
    required this.position,
    required this.imageUrl,
  });

  @override
  State<SpeakerCard> createState() => _SpeakerCardState();
}

class _SpeakerCardState extends State<SpeakerCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (_isHovered) {
        _controller.repeat();
      } else {
        _controller.stop();
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
          if (_isHovered)
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: BorderTracerPainter(
                      progress: _controller.value,
                      color: AppColors.accent1,
                    ),
                  );
                },
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(2), // Space for the moving border
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedScale(
                      scale: _isHovered ? 1.1 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              widget.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Subtle Magenta Overlay on Hover
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: _isHovered ? 0.15 : 0.0,
                            child: Container(color: AppColors.accent1),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            widget.position,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
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

class BorderTracerPainter extends CustomPainter {
  final double progress;
  final Color color;

  BorderTracerPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(12));
    final path = Path()..addRRect(rRect);

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 1); // Glow effect

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

      drawSegment(0.0); // Segment 1
      drawSegment(0.5); // Segment 2 (opposite side)
    }
  }

  @override
  bool shouldRepaint(covariant BorderTracerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

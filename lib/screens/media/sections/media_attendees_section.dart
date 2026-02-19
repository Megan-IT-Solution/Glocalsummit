import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../utils/responsive_helper.dart';
import '../../../utils/dimensions.dart';

class MediaAttendeesSection extends StatelessWidget {
  const MediaAttendeesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final crossAxisCount = isMobile ? 1 : (isTablet ? 3 : 5);

    final attendees = [
      {
        'name': 'Justin Smith',
        'position': 'Co-Founder and CEO\nSemafor',
        'imageUrl':
            'https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&q=80&w=600',
      },
      {
        'name': 'Katie Drummond',
        'position': 'Global Editorial Director\nWired',
        'imageUrl':
            'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&q=80&w=600',
      },
      {
        'name': 'Maneet Ahuja',
        'position': 'Editor at Large\nForbes',
        'imageUrl':
            'https://images.unsplash.com/photo-1580489944761-15a19d654956?auto=format&fit=crop&q=80&w=600',
      },
      {
        'name': 'Nicholas Johnston',
        'position': 'Publisher\nAxios',
        'imageUrl':
            'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=600',
      },
      {
        'name': 'Caroline Faraj',
        'position': 'CNN VP and CNN Arabic...\nCNN Arabic',
        'imageUrl':
            'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?auto=format&fit=crop&q=80&w=600',
      },
    ];

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      padding: Dimensions.getSectionPadding(context),
      child: Column(
        children: [
          Text(
            'Meet our 2026 media attendees',
            style: TextStyle(
              fontSize: isMobile ? 28 : (isTablet ? 34 : 40),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 30 : 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? 15 : 25,
              mainAxisSpacing: isMobile ? 25 : 25,
              childAspectRatio: isMobile ? 1.1 : 0.72,
            ),
            itemCount: attendees.length,
            itemBuilder: (context, index) {
              final attendee = attendees[index];
              return MediaAttendeeCard(
                name: attendee['name']!,
                position: attendee['position']!,
                imageUrl: attendee['imageUrl']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class MediaAttendeeCard extends StatefulWidget {
  final String name;
  final String position;
  final String imageUrl;

  const MediaAttendeeCard({
    super.key,
    required this.name,
    required this.position,
    required this.imageUrl,
  });

  @override
  State<MediaAttendeeCard> createState() => _MediaAttendeeCardState();
}

class _MediaAttendeeCardState extends State<MediaAttendeeCard>
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
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: AnimatedScale(
                            scale: _isHovered ? 1.05 : 1.0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            child: Image.network(
                              widget.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Subtle Overlay on Hover
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _isHovered ? 0.1 : 0.0,
                          child: Container(color: AppColors.accent1),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.position,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 12,
                            height: 1.3,
                          ),
                          maxLines: 2,
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
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 1);

    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      final totalLength = metric.length;
      final sweep = totalLength * 0.3;

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
  bool shouldRepaint(covariant BorderTracerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

import 'package:flutter/material.dart';
import '../theme/colors.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF9F9F9),
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 80),
      child: Column(
        children: [
          const Text(
            "What they're saying",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            children: [
              Expanded(
                child: _buildTestimonialCard(
                  "Web Summit is the world’s largest technology conference. It's where the future goes to be born.",
                  "The Atlantic",
                  "",
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildTestimonialCard(
                  "A grand conclave of the tech industry’s high priests... It’s where the industry meets to decide where it’s going next.",
                  "The New York Times",
                  "",
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: _buildTestimonialCard(
                  "Web Summit brings together the people and companies redefining the global tech industry.",
                  "Forbes",
                  "",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String quote, String author, String title) {
    return Container(
      padding: const EdgeInsets.all(40),
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: AppColors.accent1, size: 40),
          const SizedBox(height: 20),
          Text(
            quote,
            style: const TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: Color(0xFF333333),
              height: 1.5,
            ),
          ),
          const Spacer(),
          Text(
            author,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.primary,
            ),
          ),
          if (title.isNotEmpty)
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
        ],
      ),
    );
  }
}

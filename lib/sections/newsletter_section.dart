import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/gradient_button.dart';
import '../utils/responsive_helper.dart';
import '../utils/dimensions.dart';
import '../utils/url_helper.dart';
import '../core/formspree_endpoints.dart';
import '../services/formspree_services.dart';

class NewsletterSection extends StatefulWidget {
  const NewsletterSection({super.key});

  @override
  State<NewsletterSection> createState() => _NewsletterSectionState();
}

class _NewsletterSectionState extends State<NewsletterSection> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    super.dispose();
  }

  Future<void> _submitNewsletterForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final success = await FormspreeService.submitForm(
      endpoint: FormspreeEndpoints.info,
      fields: {
        'email': _emailController.text,
        'first_name': _firstNameController.text,
        'form_type': 'newsletter_subscription',
      },
    );

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    if (success) {
      _emailController.clear();
      _firstNameController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully subscribed to our newsletter!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Subscription failed. Please try again.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
          image: const NetworkImage(
            'https://images.unsplash.com/photo-1557804506-669a67965ba0?auto=format&fit=crop&q=80&w=1374',
          ),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      padding: Dimensions.getSectionPadding(context),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextContent(isMobile, isTablet),
                const SizedBox(height: 40),
                _buildForm(isMobile),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildTextContent(isMobile, isTablet)),
                const SizedBox(width: 80),
                Expanded(flex: 2, child: _buildForm(isMobile)),
              ],
            ),
    );
  }

  Widget _buildTextContent(bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subscribe to our newsletter to learn more',
          style: TextStyle(
            color: AppColors.headingGolden,
            fontSize: isMobile ? 28 : (isTablet ? 38 : 48),
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Join our network to receive updates, speaker news, and exclusive access to offers.',
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 16 : 18,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildForm(bool isMobile) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('Email address *'),
          const SizedBox(height: 8),
          _buildTextField(
            'user@example.com',
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 25),
          _buildLabel('First name *'),
          const SizedBox(height: 8),
          _buildTextField(
            'First name',
            controller: _firstNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                'You may withdraw your consent at any time. Learn more on our ',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              _HoverableTextSpan(
                text: 'privacy policy',
                onTap: () {
                  openUrl(
                    "https://www.termsfeed.com/live/02e8b96e-c17b-4c7b-9ef2-db56b81fb7c3",
                  );
                },
              ),
              const Text(
                ' and ',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              _HoverableTextSpan(
                text: 'T&Cs',
                onTap: () {
                  launchExternalUrl(
                    "https://www.termsfeed.com/live/bb7b958b-45fe-4de2-85e6-3be24b92f293",
                  );
                },
              ),
              const Text(
                '.',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: GradientButton(
              text: _isSubmitting
                  ? 'Submitting...'
                  : 'Submit interest and continue',
              padding: isMobile ? 15 : 20,
              onPressed: _isSubmitting ? null : _submitNewsletterForm,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTextField(
    String hint, {
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
        ),
      ),
    );
  }
}

class _HoverableTextSpan extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _HoverableTextSpan({required this.text, required this.onTap});

  @override
  State<_HoverableTextSpan> createState() => _HoverableTextSpanState();
}

class _HoverableTextSpanState extends State<_HoverableTextSpan> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity()..scale(_isHovered ? 1.1 : 1.0),
          child: Text(
            widget.text,
            style: TextStyle(
              color: _isHovered ? AppColors.headingGolden : Colors.white,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationColor: _isHovered
                  ? AppColors.headingGolden
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

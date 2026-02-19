import 'package:flutter/material.dart';

import '../../../core/formspree_endpoints.dart';
import '../../../services/formspree_services.dart';
import '../../../theme/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/responsive_helper.dart';
import '../../../widgets/gradient_button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitContactForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final success = await FormspreeService.submitForm(
      endpoint: FormspreeEndpoints.info,
      fields: {
        'name': _nameController.text,
        'email': _emailController.text,
        'subject': _subjectController.text,
        'message': _messageController.text,
        'form_type': 'general_inquiry',
      },
    );

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    if (success) {
      // Clear form on success
      _nameController.clear();
      _emailController.clear();
      _subjectController.clear();
      _messageController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Message sent successfully! We\'ll get back to you soon.',
          ),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Submission failed. Please try again.'),
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
      color: Colors.white,
      width: double.infinity,
      padding: Dimensions.getSectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMobile || isTablet
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextContent(isMobile),
                    const SizedBox(height: 50),
                    _buildFormSection(isMobile),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: _buildTextContent(isMobile)),
                    const SizedBox(width: 80),
                    Expanded(flex: 1, child: _buildFormSection(isMobile)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CONTACT US',
          style: TextStyle(
            color: Colors.black,
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'For:',
          style: TextStyle(
            color: Colors.black,
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildBulletPoint('General enquiries', isMobile),
        _buildBulletPoint('Sponsorship opportunities', isMobile),
        _buildBulletPoint('Expo participation', isMobile),
        _buildBulletPoint('Speaking opportunities', isMobile),
        const SizedBox(height: 30),
        Text(
          '📞 Contact Details',
          style: TextStyle(color: Colors.black, fontSize: isMobile ? 16 : 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Mr. Sanjay Deshpande: +971 55 110 6306',
          style: TextStyle(color: Colors.black, fontSize: isMobile ? 16 : 18),
        ),
        const SizedBox(height: 10),
        Text(
          'Mr. Raj Khaleel: +971 56 815 1330',
          style: TextStyle(color: Colors.black, fontSize: isMobile ? 16 : 18),
        ),
      ],
    );
  }

  Widget _buildFormSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              '📩 Contact Form',
              style: TextStyle(
                color: AppColors.headingGolden,
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField(
              'Your Name',
              controller: _nameController,
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter your name'
                  : null,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Your Email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter your email';
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Subject',
              controller: _subjectController,
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter a subject'
                  : null,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              'Message',
              controller: _messageController,
              maxLines: 5,
              validator: (value) => (value == null || value.isEmpty)
                  ? 'Please enter your message'
                  : null,
            ),
            const SizedBox(height: 30),
            GradientButton(
              text: _isSubmitting ? 'Sending...' : 'Send Message',
              width: double.infinity,
              padding: isMobile ? 15 : 20,
              onPressed: _isSubmitting ? null : () => _submitContactForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: isMobile ? 16 : 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String hint, {
    int maxLines = 1,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white30),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.meshCyan),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
      ),
    );
  }
}

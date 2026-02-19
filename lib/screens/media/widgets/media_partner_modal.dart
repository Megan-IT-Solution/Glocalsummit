import 'package:flutter/material.dart';

import '../../../core/formspree_endpoints.dart';
import '../../../services/formspree_services.dart';
import '../../../theme/colors.dart';
import '../../../widgets/gradient_button.dart';

class MediaPartnerModal extends StatefulWidget {
  const MediaPartnerModal({super.key});

  @override
  State<MediaPartnerModal> createState() => _MediaPartnerModalState();
}

class _MediaPartnerModalState extends State<MediaPartnerModal> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mediaHouseController = TextEditingController();
  final _designationController = TextEditingController();

  bool _isSubmitting = false;

  String _platformType = 'Digital Media';
  final List<String> _platforms = [
    'Digital Media',
    'Print Media',
    'Television',
    'Radio',
    'Freelance/Influencer',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _mediaHouseController.dispose();
    _designationController.dispose();
    super.dispose();
  }

  Future<void> _submitMediaPartnerApplication() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final success = await FormspreeService.submitForm(
      endpoint: FormspreeEndpoints.media,
      fields: {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'media_house': _mediaHouseController.text,
        'designation': _designationController.text,
        'platform_type': _platformType,
        'form_type': 'media_partner_application',
      },
    );

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    if (success) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Media partnership application submitted successfully!',
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
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.headingGolden.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Media Partnership',
                        style: TextStyle(
                          color: AppColors.headingGolden,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: _isSubmitting
                            ? null
                            : () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Join us as a media partner to cover the GLOCAL Summit 2026.',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(
                    label: 'Full Name',
                    controller: _nameController,
                    hint: 'Enter your name',
                    icon: Icons.person_outline,
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Please enter your name'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    label: 'Email Address',
                    controller: _emailController,
                    hint: 'Enter your email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter your email';
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value))
                        return 'Enter a valid email';
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    label: 'Phone Number',
                    controller: _phoneController,
                    hint: 'Enter your phone number',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Please enter your phone number'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    label: 'Media House / Company',
                    controller: _mediaHouseController,
                    hint: 'Enter your organization name',
                    icon: Icons.business_outlined,
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Please enter your media house'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    label: 'Designation',
                    controller: _designationController,
                    hint: 'e.g. Journalist, Editor, Photographer',
                    icon: Icons.work_outline,
                    validator: (value) => (value == null || value.isEmpty)
                        ? 'Please enter your designation'
                        : null,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Primary Platform',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _platformType,
                        dropdownColor: AppColors.primary,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white70,
                        ),
                        isExpanded: true,
                        style: const TextStyle(color: Colors.white),
                        items: _platforms.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _platformType = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: GradientButton(
                      text: _isSubmitting
                          ? 'Submitting...'
                          : 'Apply for Partnership',
                      onPressed: _isSubmitting
                          ? null
                          : () => _submitMediaPartnerApplication(),
                      padding: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.3),
              fontSize: 14,
            ),
            prefixIcon: Icon(
              icon,
              color: AppColors.headingGolden.withOpacity(0.7),
              size: 20,
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.headingGolden.withOpacity(0.5),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
          ),
        ),
      ],
    );
  }
}

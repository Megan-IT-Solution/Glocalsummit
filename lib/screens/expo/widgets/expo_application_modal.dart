import 'package:flutter/material.dart';

import '../../../core/formspree_endpoints.dart';
import '../../../services/formspree_services.dart';
import '../../../theme/colors.dart';
import '../../../widgets/gradient_button.dart';

class ExpoApplicationModal extends StatefulWidget {
  const ExpoApplicationModal({super.key});

  @override
  State<ExpoApplicationModal> createState() => _ExpoApplicationModalState();
}

class _ExpoApplicationModalState extends State<ExpoApplicationModal> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyController = TextEditingController();
  final _industryController = TextEditingController();

  bool _isSubmitting = false;

  String _stallType = 'Standard';
  final List<String> _stallTypes = ['Standard', 'Premium', 'Sponsorship Hub'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    _industryController.dispose();
    super.dispose();
  }

  Future<void> _submitExpoApplication() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final success = await FormspreeService.submitForm(
      endpoint: FormspreeEndpoints.expo,
      fields: {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'company': _companyController.text,
        'industry': _industryController.text,
        'stall_type': _stallType,
        'form_type': 'expo_application',
      },
    );

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    if (success) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expo application submitted successfully!'),
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
              color: AppColors.headingGolden.withValues(alpha: 0.3),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
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
                        'Apply for Expo Stall',
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
                  const SizedBox(height: 30),

                  _buildTextField(
                    label: 'Full Name',
                    controller: _nameController,
                    icon: Icons.person_outline,
                    validator: (v) =>
                        v!.isEmpty ? 'Please enter your name' : null,
                  ),
                  const SizedBox(height: 20),

                  _buildTextField(
                    label: 'Email Address',
                    controller: _emailController,
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v!.isEmpty) return 'Please enter your email';
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(v)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  _buildTextField(
                    label: 'Phone Number',
                    controller: _phoneController,
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validator: (v) =>
                        v!.isEmpty ? 'Please enter your phone number' : null,
                  ),
                  const SizedBox(height: 20),

                  _buildTextField(
                    label: 'Company Name',
                    controller: _companyController,
                    icon: Icons.business_outlined,
                    validator: (v) =>
                        v!.isEmpty ? 'Please enter company name' : null,
                  ),
                  const SizedBox(height: 20),

                  _buildTextField(
                    label: 'Industry',
                    controller: _industryController,
                    icon: Icons.category_outlined,
                    validator: (v) =>
                        v!.isEmpty ? 'Please enter industry' : null,
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Stall Type',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),

                  DropdownButtonFormField<String>(
                    initialValue: _stallType,
                    dropdownColor: AppColors.primary,
                    items: _stallTypes
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => _stallType = v!),
                    decoration: _inputDecoration(),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    child: GradientButton(
                      text: _isSubmitting
                          ? 'Submitting...'
                          : 'Submit Application',
                      onPressed: _isSubmitting
                          ? null
                          : () => _submitExpoApplication(),
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
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(color: Colors.white),
          decoration: _inputDecoration(icon: icon),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({IconData? icon}) {
    return InputDecoration(
      prefixIcon: icon != null
          ? Icon(icon, color: AppColors.headingGolden)
          : null,
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.05),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.headingGolden.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'custom_button.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isMale = false;
  bool _isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "Registration Form",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto",
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Phone Number with Country Code Dropdown
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: const OutlineInputBorder(),
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(left: 8),
                    child: CountryCodePicker(
                      onChanged: (countryCode) {
                        // Handle country code change if needed
                      },
                      initialSelection: 'PK',
                      favorite: const ['+92', 'US'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      padding: EdgeInsets.zero,
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Password Field
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              // Confirm Password Field
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              // Gender Selection with Checkboxes
              const Text(
                'Gender',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isMale,
                    onChanged: (value) {
                      setState(() {
                        _isMale = value ?? false;
                        if (_isMale)
                          _isFemale = false; // Ensure only one is selected
                      });
                    },
                  ),
                  const Text('Male'),
                  const SizedBox(width: 20),
                  Checkbox(
                    value: _isFemale,
                    onChanged: (value) {
                      setState(() {
                        _isFemale = value ?? false;
                        if (_isFemale)
                          _isMale = false; // Ensure only one is selected
                      });
                    },
                  ),
                  const Text('Female'),
                ],
              ),
              const SizedBox(height: 24),

              // Register Button
              CustomButton(
                label: 'Register',
                onPressed: () {
                  // Handle registration logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration Successful!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
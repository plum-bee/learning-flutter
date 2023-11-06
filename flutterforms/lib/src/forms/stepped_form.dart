import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SteppedForm extends StatefulWidget {
  const SteppedForm({Key? key}) : super(key: key);

  @override
  State<SteppedForm> createState() => _SteppedFormState();
}

class _SteppedFormState extends State<SteppedForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;

  InputDecoration _inputDecoration(
      {required String labelText, required IconData icon}) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      prefixIcon: Icon(icon, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stepped Form')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Rafael Chambilla',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            'Please fill out the form below',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FormBuilder(
              key: _formKey,
              child: Stepper(
                type: StepperType.horizontal,
                currentStep: _currentStep,
                onStepContinue: () {
                  if (_currentStep <= 2) {
                    setState(() => _currentStep += 1);
                  }
                },
                onStepCancel: () {
                  if (_currentStep > 0) {
                    setState(() => _currentStep -= 1);
                  }
                },
                controlsBuilder: (context, details) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_currentStep > 0)
                            TextButton(
                              onPressed: details.onStepCancel,
                              child: const Text('Back'),
                            ),
                          if (_currentStep < 2)
                            ElevatedButton(
                              onPressed: details.onStepContinue,
                              child: const Text('Next'),
                            ),
                          if (_currentStep == 2)
                            ElevatedButton(
                              onPressed: () {
                                print(_formKey.currentState?.value);
                                Navigator.pop(context);
                              },
                              child: const Text('Upload'),
                            ),
                        ],
                      ),
                    ],
                  );
                },
                steps: [
                  Step(
                    title: const Text('Personal'),
                    content: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'name',
                          decoration: _inputDecoration(
                            labelText: 'Name',
                            icon: Icons.person,
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'surname',
                          decoration: _inputDecoration(
                            labelText: 'Surname',
                            icon: Icons.person,
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'dni',
                          decoration: _inputDecoration(
                            labelText: 'DNI',
                            icon: Icons.credit_card,
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.minLength(9),
                          ]),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep > 0
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Contact'),
                    content: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'email',
                          decoration: _inputDecoration(
                            labelText: 'Email',
                            icon: Icons.email,
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'address',
                          decoration: _inputDecoration(
                            labelText: 'Address',
                            icon: Icons.home,
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: _inputDecoration(
                            labelText: 'Phone Number',
                            icon: Icons.phone,
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.minLength(9),
                          ]),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 1,
                    state: _currentStep > 1
                        ? StepState.complete
                        : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Submit'),
                    content: Column(
                      children: [
                        const Text(
                          'Form Data:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Name: ${_formKey.currentState?.fields['name']?.value}"),
                        Text(
                            "Surname: ${_formKey.currentState?.fields['surname']?.value}"),
                        Text(
                            "DNI: ${_formKey.currentState?.fields['dni']?.value}"),
                        Text(
                            "Email: ${_formKey.currentState?.fields['email']?.value}"),
                        Text(
                            "Address: ${_formKey.currentState?.fields['address']?.value}"),
                        Text(
                            "Phone: ${_formKey.currentState?.fields['phone']?.value}"),
                      ],
                    ),
                    isActive: _currentStep >= 2,
                    state: _currentStep == 2
                        ? StepState.complete
                        : StepState.indexed,
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

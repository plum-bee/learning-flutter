import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class VehicleForm extends StatefulWidget {
  const VehicleForm({Key? key}) : super(key: key);

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Vehicle Form'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  'Rafael Chambilla',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Text(
                  'Please fill out the form below',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Please provide the speed of your vehicle',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Select the speed range that matches your vehicle',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              FormBuilderRadioGroup<String>(
                name: 'speed',
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                orientation: OptionsOrientation.vertical,
                validator: FormBuilderValidators.required(),
                options: [
                  '0 - 50 km/h',
                  '51 - 100 km/h',
                  '101 - 150 km/h',
                ]
                    .map(
                      (speed) => FormBuilderFieldOption(
                        value: speed,
                        child: Text(speed),
                      ),
                    )
                    .toList(growable: false),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter your remarks',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'remarks',
                decoration: InputDecoration(
                  labelText: 'Remarks',
                  hintText: 'Enter your remarks',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLines: null,
                maxLength: 300,
                buildCounter: (
                  BuildContext context, {
                  required int currentLength,
                  required bool isFocused,
                  required int? maxLength,
                }) =>
                    Text(
                  '$currentLength/$maxLength',
                  style: const TextStyle(fontSize: 10),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please provide the maximum speed of your vehicle',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              FormBuilderDropdown(
                name: 'max_speed',
                decoration: InputDecoration(
                  labelText: 'Select an option',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
                validator: FormBuilderValidators.required(),
                items: [
                  '100 mph',
                  '150 mph',
                  '200 mph',
                ]
                    .map(
                      (maxSpeed) => DropdownMenuItem(
                        value: maxSpeed,
                        child: Text(maxSpeed),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please provide the speed of your vehicle in the last hour',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              FormBuilderCheckboxGroup<String>(
                name: 'speed_pas_hour',
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                orientation: OptionsOrientation.vertical,
                options: [
                  '0-30 mph',
                  '31-60 mph',
                  '61-90 mph',
                  '90+ mph',
                ]
                    .map(
                      (speed) => FormBuilderFieldOption(
                        value: speed,
                        child: Text(speed),
                      ),
                    )
                    .toList(growable: false),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      print(_formKey.currentState?.value);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

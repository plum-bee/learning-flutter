import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CatForm extends StatefulWidget {
  const CatForm({Key? key}) : super(key: key);
  @override
  State<CatForm> createState() => _CatFormState();
}

class _CatFormState extends State<CatForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  InputDecoration _inputDecoration(
      {required String labelText, required IconData icon}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(fontSize: 18),
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
      appBar: AppBar(
        title: const Text('Cat Form'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Cat Information',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    FormBuilderChoiceChip(
                      name: 'breed',
                      decoration: _inputDecoration(
                          labelText: 'Select Breed', icon: Icons.category),
                      options: const [
                        FormBuilderChipOption(
                          value: 'Persian',
                          child: Text('Persian'),
                        ),
                        FormBuilderChipOption(
                          value: 'Siamese',
                          child: Text('Siamese'),
                        ),
                        FormBuilderChipOption(
                          value: 'Maine Coon',
                          child: Text('Maine Coon'),
                        ),
                        FormBuilderChipOption(
                          value: 'Ragdoll',
                          child: Text('Ragdoll'),
                        ),
                        FormBuilderChipOption(
                          value: 'Bengal',
                          child: Text('Bengal'),
                        ),
                        FormBuilderChipOption(
                          value: 'Abyssinian',
                          child: Text('Abyssinian'),
                        ),
                        FormBuilderChipOption(
                          value: 'Birman',
                          child: Text('Birman'),
                        ),
                        FormBuilderChipOption(
                          value: 'Oriental Shorthair',
                          child: Text('Oriental Shorthair'),
                        ),
                        FormBuilderChipOption(
                          value: 'Sphynx',
                          child: Text('Sphynx'),
                        ),
                        FormBuilderChipOption(
                          value: 'Devon Rex',
                          child: Text('Devon Rex'),
                        ),
                        FormBuilderChipOption(
                          value: 'Scottish Fold',
                          child: Text('Scottish Fold'),
                        ),
                        FormBuilderChipOption(
                          value: 'British Shorthair',
                          child: Text('British Shorthair'),
                        ),
                        FormBuilderChipOption(
                          value: 'Russian Blue',
                          child: Text('Russian Blue'),
                        ),
                        FormBuilderChipOption(
                          value: 'Norwegian Forest',
                          child: Text('Norwegian Forest'),
                        ),
                        FormBuilderChipOption(
                          value: 'Siberian',
                          child: Text('Siberian'),
                        ),
                      ],
                      selectedColor: Colors.blue,
                      spacing: 10.0,
                      runSpacing: 5.0,
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'name',
                      decoration:
                          _inputDecoration(labelText: 'Name', icon: Icons.pets),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderDropdown(
                      name: 'gender',
                      decoration: _inputDecoration(
                          labelText: 'Select Gender', icon: Icons.female),
                      items: ['Male', 'Female']
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(growable: false),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderRadioGroup(
                      name: 'neutered',
                      decoration: _inputDecoration(
                          labelText: 'Is your cat neutered?',
                          icon: Icons.healing),
                      options: const [
                        FormBuilderFieldOption(
                            value: 'Yes', child: Text('Yes')),
                        FormBuilderFieldOption(value: 'No', child: Text('No')),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FormBuilderDateTimePicker(
                      name: 'birthdate',
                      inputType: InputType.date,
                      decoration: _inputDecoration(
                          labelText: 'Birthdate', icon: Icons.calendar_today),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderSwitch(
                      name: 'vaccinated',
                      title: const Text('Is your cat vaccinated?',
                          style: TextStyle(fontSize: 18, color: Colors.grey)),
                      decoration: _inputDecoration(
                          labelText: 'Vaccinated', icon: Icons.local_hospital),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderSlider(
                        name: 'weight',
                        min: 0,
                        max: 20,
                        initialValue: 5,
                        divisions: 20,
                        decoration: _inputDecoration(
                            labelText: 'Weight (KG)', icon: Icons.line_weight),
                        valueTransformer: (value) => value?.round(),
                        displayValues: DisplayValues.all),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        print(_formKey.currentState?.value);
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

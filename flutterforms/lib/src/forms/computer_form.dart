import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class ComputerPartForm extends StatefulWidget {
  const ComputerPartForm({Key? key}) : super(key: key);

  @override
  State<ComputerPartForm> createState() => _ComputerPartFormState();
}

class _ComputerPartFormState extends State<ComputerPartForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _processorBrands = ['Intel', 'AMD'];
  final _memorySizes = ['8GB', '16GB', '32GB', '64GB'];

  String _sliderLabel = '256 GB';

  InputDecoration _inputDecoration(
      {required String labelText, required IconData icon}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(fontSize: 18),
      border: const OutlineInputBorder(),
      prefixIcon: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Computer Assembly',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
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
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    FormBuilderDateTimePicker(
                      name: 'assembly_date',
                      inputType: InputType.date,
                      format: DateFormat('dd-MM-yyyy'),
                      decoration: _inputDecoration(
                        labelText: 'Assembly Date',
                        icon: Icons.calendar_today,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderDateTimePicker(
                      name: 'assembly_time',
                      inputType: InputType.time,
                      format: DateFormat('HH:mm'),
                      decoration: _inputDecoration(
                        labelText: 'Assembly Time',
                        icon: Icons.access_time,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderDropdown(
                      name: 'processor_brand',
                      decoration: _inputDecoration(
                        labelText: 'Processor Brand',
                        icon: Icons.memory,
                      ),
                      items: _processorBrands
                          .map((brand) => DropdownMenuItem(
                                value: brand,
                                child: Text(brand),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderSlider(
                      name: 'storage_size',
                      min: 512.0,
                      max: 8192.0,
                      initialValue: 512.0,
                      divisions: 15,
                      decoration: _inputDecoration(
                        labelText: 'Storage Size',
                        icon: Icons.storage,
                      ),
                      valueTransformer: (value) {
                        if (value! >= 1024) {
                          final tb = value / 1024;
                          return '${tb.toStringAsFixed(1)} TB';
                        } else {
                          return '${value.toStringAsFixed(0)} GB';
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          if (value! >= 1024) {
                            final tb = value / 1024;
                            _sliderLabel = '${tb.toStringAsFixed(1)} TB';
                          } else {
                            _sliderLabel = '${value.toStringAsFixed(0)} GB';
                          }
                        });
                      },
                      label: _sliderLabel,
                      displayValues: DisplayValues.all,
                      numberFormat: NumberFormat(),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderChoiceChip(
                      name: 'memory_size',
                      decoration: _inputDecoration(
                        labelText: 'RAM Size',
                        icon: Icons.memory,
                      ),
                      spacing: 10.0,
                      options: _memorySizes
                          .map((size) => FormBuilderChipOption(
                                value: size,
                                child: Text(size),
                              ))
                          .toList(),
                      selectedColor: Colors.blue,
                    ),
                    const SizedBox(height: 20),
                    FormBuilderFilterChip(
                      name: 'additional_parts',
                      decoration: _inputDecoration(
                        labelText: 'Additional Parts',
                        icon: Icons.extension,
                      ),
                      spacing: 10.0,
                      runSpacing: 5.0,
                      options: const [
                        FormBuilderChipOption(
                          value: 'Graphics Card',
                          child: Text('Graphics Card'),
                        ),
                        FormBuilderChipOption(
                          value: 'Sound Card',
                          child: Text('Sound Card'),
                        ),
                        FormBuilderChipOption(
                          value: 'Ethernet Card',
                          child: Text('Ethernet Card'),
                        ),
                        FormBuilderChipOption(
                          value: 'SSD',
                          child: Text('SSD'),
                        ),
                        FormBuilderChipOption(
                          value: 'Power Supply',
                          child: Text('Power Supply'),
                        ),
                        FormBuilderChipOption(
                          value: 'CPU Cooler',
                          child: Text('CPU Cooler'),
                        ),
                        FormBuilderChipOption(
                          value: 'Optical Drive',
                          child: Text('Optical Drive'),
                        ),
                        FormBuilderChipOption(
                          value: 'Case Fan',
                          child: Text('Case Fan'),
                        ),
                        FormBuilderChipOption(
                          value: 'RGB Lighting',
                          child: Text('RGB Lighting'),
                        ),
                        FormBuilderChipOption(
                          value: 'Wireless Adapter',
                          child: Text('Wireless Adapter'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'customer_name',
                      decoration: _inputDecoration(
                        labelText: 'Customer Name',
                        icon: Icons.person,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FormBuilderTextField(
                      name: 'customer_email',
                      decoration: _inputDecoration(
                        labelText: 'Customer Email',
                        icon: Icons.email,
                      ),
                      keyboardType: TextInputType.emailAddress, //guay
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          print(_formKey.currentState?.value);
                        }
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

import 'package:flutter/material.dart';

class RadioGender extends StatefulWidget {
  final List<String> genderOptions; // List of gender options

  const RadioGender({
    super.key,
    required this.genderOptions,
  });

  @override
  State<RadioGender> createState() => _RadioGenderState();
}

class _RadioGenderState extends State<RadioGender> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.genderOptions.map((gender) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
          child: Row(
            children: [
              Radio<String>(
                value: gender,
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                activeColor: Colors.blue,
              ),
              Text(gender,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ],
          ),
        );
      }).toList(),
    );
  }
}

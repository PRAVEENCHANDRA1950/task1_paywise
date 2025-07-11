import 'package:flutter/material.dart';
import 'package:task_one_paywise/features/onbording/presentation/widgets/custom_btn.dart';
import '../widgets/custom_text_field.dart';

class Step1UserDetails extends StatefulWidget {
  const Step1UserDetails({super.key});

  @override
  State<Step1UserDetails> createState() => _Step1UserDetailsState();
}

class _Step1UserDetailsState extends State<Step1UserDetails> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Step 1: User Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                  label: 'Name',
                  validator: (val) => validate(val),
                  controller: nameController),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Mobile Number',
                validator: (val) => phoneValidate(val),
                controller: mobileController,
                inputType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: "Next",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/step2', arguments: {
                      'name': nameController.text.trim(),
                      'mobile': mobileController.text.trim()
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("All fields are required")));
                    return;
                  }

                  // if (nameController.text.isEmpty ||
                  //     mobileController.text.length != 10) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text("All fields are required")));
                  //   return;
                  // }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

phoneValidate(val) {
  if (val == null || val.isEmpty) {
    return "mobile no required";
  } else if (val.length != 10) {
    return "mobile no length must be 10";
  } else {
    return null;
  }
}

validate(val) {
  if (val == null || val.isEmpty) {
    return "name required";
  } else {
    return null;
  }
}

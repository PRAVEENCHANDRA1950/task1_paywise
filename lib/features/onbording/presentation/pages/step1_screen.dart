import 'package:flutter/material.dart';
import 'package:task_one_paywise/features/onbording/presentation/widgets/custom_btn.dart';
import '../widgets/custom_text_field.dart';

class Step1UserDetails extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  Step1UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Step 1: User Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(label: 'Name', controller: nameController),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Mobile Number',
              controller: mobileController,
              inputType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Next",
              onPressed: () {
                if (nameController.text.isEmpty ||
                    mobileController.text.length != 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("All fields are required")));
                  return;
                }
                Navigator.pushNamed(context, '/step2', arguments: {
                  'name': nameController.text.trim(),
                  'mobile': mobileController.text.trim()
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

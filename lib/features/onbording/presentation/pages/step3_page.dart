// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:task_one_paywise/features/onbording/presentation/widgets/custom_btn.dart';
import 'package:task_one_paywise/utils/services/shared_preff_methods.dart';

import '../../data/models/user_model.dart';

class Step3TermsConditions extends StatefulWidget {
  const Step3TermsConditions({super.key});

  @override
  State<Step3TermsConditions> createState() => _Step3TermsConditionsState();
}

class _Step3TermsConditionsState extends State<Step3TermsConditions> {
  bool accepted = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: const Text("Step 3: Terms & Conditions")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CheckboxListTile(
              value: accepted,
              onChanged: (val) => setState(() => accepted = val!),
              title: const Text("I accept the Terms & Conditions"),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Finish",
              onPressed: () async {
                if (!accepted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Please accept the terms")));
                  return;
                }

                final user = UserModel(
                  name: args['name'],
                  mobile: args['mobile'],
                  pin: args['pin'],
                );

                await sharedPreffMethods.saveUser(user);

                // Navigator.pushReplacementNamed(context, '/success');
                Navigator.pushNamedAndRemoveUntil(
                    context, '/success', (Route<dynamic> route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}

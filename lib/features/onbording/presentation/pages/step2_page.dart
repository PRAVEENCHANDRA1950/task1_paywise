import 'package:flutter/material.dart';
import 'package:task_one_paywise/features/onbording/presentation/widgets/custom_btn.dart';
import '../widgets/custom_text_field.dart';

class Step2PinSetup extends StatelessWidget {
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();

  Step2PinSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: const Text("Step 2: Set PIN")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              label: 'Enter 4-digit PIN',
              controller: pinController,
              inputType: TextInputType.number,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Confirm PIN',
              controller: confirmPinController,
              inputType: TextInputType.number,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: "Next",
              onPressed: () {
                if (pinController.text.length != 4 ||
                    pinController.text != confirmPinController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("PINs do not match or are invalid")));
                  return;
                }
                Navigator.pushNamed(context, '/step3',
                    arguments: {...args, 'pin': pinController.text});
              },
            )
          ],
        ),
      ),
    );
  }
}

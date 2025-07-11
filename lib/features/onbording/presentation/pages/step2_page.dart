import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_one_paywise/features/onbording/presentation/widgets/custom_btn.dart';
import '../widgets/custom_text_field.dart';

class Step2PinSetup extends StatefulWidget {
  const Step2PinSetup({super.key});

  @override
  State<Step2PinSetup> createState() => _Step2PinSetupState();
}

class _Step2PinSetupState extends State<Step2PinSetup> {
  final TextEditingController pinController = TextEditingController();

  final TextEditingController confirmPinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // Object? args = {};
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //    args = ModalRoute.of(context)?.settings.arguments;

  //   if (args == null || args is! Map) {
  //     // Redirect to Page1 if null or not a Map
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       Navigator.pushReplacementNamed(context, '/step1');
  //     });
  //   } else {
  //     // Use args safely here
  //     final data = args as Map;
  //     print(data);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(title: const Text("Step 2: Set PIN")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                label: 'Enter 4-digit PIN',
                controller: pinController,
                inputType: TextInputType.number,
                obscureText: true,
                validator: (val) => pinValidate(val),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Confirm PIN',
                controller: confirmPinController,
                inputType: TextInputType.number,
                obscureText: true,
                validator: (val) => pinValidate(val),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: "Next",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (pinController.text.length != 4 ||
                        pinController.text != confirmPinController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("PINs do not match or are invalid")));
                      return;
                    }
                    Navigator.pushNamed(context, '/step3',
                        arguments: {...args, 'pin': pinController.text});
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

pinValidate(val) {
  log(val);

  if (val == null || val.isEmpty) {
    return "pin  no required";
  } else if (val.toString().length != 4) {
    return "pin length must be 4";
  } else {
    return null;
  }
}

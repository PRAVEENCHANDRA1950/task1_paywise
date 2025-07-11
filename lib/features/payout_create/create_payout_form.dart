// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:task_one_paywise/features/history/page/history.dart';
import 'package:task_one_paywise/features/payout_create/models/payout_model.dart';
import 'package:task_one_paywise/features/payout_create/widgets/create_btn.dart';
import 'package:task_one_paywise/features/payout_create/widgets/input_fields.dart';
import 'package:task_one_paywise/utils/const/app_colors.dart';
import 'package:task_one_paywise/utils/database/shared_preff_methods.dart';

class CreatePayoutForm extends StatefulWidget {
  const CreatePayoutForm({super.key});

  @override
  State<CreatePayoutForm> createState() => _CreatePayoutFormState();
}

class _CreatePayoutFormState extends State<CreatePayoutForm> {
//   • Fields: Beneficiary Name, Account Number, IFSC, and Amount
// • Validate all fields and highlight any input errors
// • Amount should be greater than ₹10 and less than ₹1,00,000
// • On submit, store the form data using Hive or SharedPreferences
// • Create a History screen to display all past payout requests
// • Use Flutter Form, proper validation, and a local database package

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController accNumberController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Payout",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => History()));
              },
              icon: Icon(Icons.history_sharp))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                InputFields(
                  controller: nameController,
                  label: "Beneficiary Name",
                  validator: (val) =>
                      validator(val, "baneficiary name required"),
                ),
                InputFields(
                  controller: accNumberController,
                  label: "Account Number",
                  keyboardType: TextInputType.number,
                  validator: (val) => validator(val, "account no required"),
                ),
                InputFields(
                  controller: ifscController,
                  label: "IFSC",
                  validator: (val) => validator(val, "IFRC  required"),
                ),
                InputFields(
                    controller: amountController,
                    label: "Amount",
                    keyboardType: TextInputType.number,
                    validator: (val) => amountValidator(val)),
                SizedBox(
                  height: 20,
                ),
                CreateBtn(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final PayoutModel val = PayoutModel(
                          accNo: accNumberController.text.trim(),
                          ifsc: ifscController.text.trim(),
                          amount: double.parse(amountController.text.trim()),
                          name: nameController.text.trim(),
                        );

                        await storePaywise(val);
                        accNumberController.clear();
                        ifscController.clear();
                        amountController.clear();
                        nameController.clear();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.green,
                              content: Text('Paywise created successfully')),
                        );
                      }
                    },
                    label: "Create Paywise")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? validator(val, String message) {
  if (val == null || val.isEmpty) {
    return message;
  } else {
    return null;
  }
}

amountValidator(val) {
  if (val == null || val.isEmpty) {
    return "amount field is required";
  }

  // else if (double.tryParse(val)! > 10.00) {
  // return "s"
  // }
  else if (double.tryParse(val)! < 10.00) {
    return "greater than ₹10";
  } else if (double.tryParse(val)! > 100000) {
    return "Less than 100000";
  } else {
    return null;
  }
}

storePaywise(val) async {
  await SharedPreffMethods().storePayrollInDB(val);
}

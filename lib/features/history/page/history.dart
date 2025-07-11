import 'package:flutter/material.dart';
import 'package:task_one_paywise/utils/const/app_colors.dart';
import 'package:task_one_paywise/utils/database/shared_preff_methods.dart';

import '../../payout_create/models/payout_model.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<PayoutModel> _payrolls = [];

  @override
  void initState() {
    super.initState();
    _loadPayrolls();
  }

  Future<void> _loadPayrolls() async {
    final List<PayoutModel> data = await SharedPreffMethods().getAllPayrolls();
    setState(() {
      _payrolls = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payroll History'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: _payrolls.isEmpty
          ? const Center(child: Text("No payrolls found."))
          : ListView.builder(
              itemCount: _payrolls.length,
              itemBuilder: (context, index) {
                final payroll = _payrolls[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(payroll.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Account No: ${payroll.accNo}"),
                        Text("IFSC: ${payroll.ifsc}"),
                        Text("Amount: ₹${payroll.amount.toStringAsFixed(2)}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

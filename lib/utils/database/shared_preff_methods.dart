import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_one_paywise/features/payout_create/models/payout_model.dart';

class SharedPreffMethods {
  static String payrollsKey = "PAYROLLS";

  Future storePayrollInDB(PayoutModel payroll) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> storedList = prefs.getStringList(payrollsKey) ?? [];

    final String payrollJson = jsonEncode(payroll.toJson());

    storedList.add(payrollJson);

    await prefs.setStringList(payrollsKey, storedList);
  }

  Future<List<PayoutModel>> getAllPayrolls() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> storedList = prefs.getStringList(payrollsKey) ?? [];

    return storedList
        .map((payrollJson) => PayoutModel.fromJson(jsonDecode(payrollJson)))
        .toList();
  }
}

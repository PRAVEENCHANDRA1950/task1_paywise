class PayoutModel {
  final String name;
  final String accNo;
  final String ifsc;
  final double amount;

  const PayoutModel({
    required this.accNo,
    required this.ifsc,
    required this.amount,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'accNo': accNo,
      'ifsc': ifsc,
      'amount': amount,
    };
  }

  factory PayoutModel.fromJson(Map<String, dynamic> json) {
    return PayoutModel(
      name: json['name'] as String,
      accNo: json['accNo'] as String,
      ifsc: json['ifsc'] as String,
      amount: (json['amount'] as num).toDouble(),
    );
  }
}

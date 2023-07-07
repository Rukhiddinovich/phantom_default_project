
class CurrencyModel {
  final num id;
  final String cardType;
  final String cardNumber;
  final String bankName;
  final num moneyAmount;
  final String cardCurrency;
  final String expireDate;
  final String iconImage;
  final dynamic colors;

  CurrencyModel({
    required this.id,
    required this.bankName,
    required this.cardCurrency,
    required this.cardNumber,
    required this.cardType,
    required this.colors,
    required this.expireDate,
    required this.iconImage,
    required this.moneyAmount,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json["id"] as num? ?? 0,
      bankName: json["bank_name"]as String? ?? "",
      cardCurrency: json["card_currency"]as String? ?? "SO'M",
      cardNumber: json["card_number"]as String? ?? "",
      cardType: json["card_type"]as String? ?? "",
      expireDate: json["expire_date"]as String? ?? "",
      iconImage: json["icon_image"]as String? ?? "",
      moneyAmount: json["money_amount"]as num? ?? 0,
      colors: json["colors"],
    );
  }
}

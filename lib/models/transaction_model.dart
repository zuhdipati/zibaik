class Transaction {
  String id;
  int amount;
  String categoryType;
  String transactionType;
  String userId;
  String iconUrl;
  int quantity;
  String comment;
  DateTime createdTimestamp;
  DateTime updatedTimestamp;

  Transaction({
    required this.id,
    required this.amount,
    required this.categoryType,
    required this.transactionType,
    required this.userId,
    required this.iconUrl,
    required this.quantity,
    required this.comment,
    required this.createdTimestamp,
    required this.updatedTimestamp,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["_id"],
        amount: json["amount"],
        categoryType: json["category_type"],
        transactionType: json["transaction_type"],
        userId: json["user_id"],
        iconUrl: json["icon_url"],
        quantity: json["quantity"],
        comment: json["comment"],
        createdTimestamp: DateTime.parse(json["created_timestamp"]),
        updatedTimestamp: DateTime.parse(json["updated_timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "amount": amount,
        "category_type": categoryType,
        "transaction_type": transactionType,
        "user_id": userId,
        "icon_url": iconUrl,
        "quantity": quantity,
        "comment": comment,
        "created_timestamp": createdTimestamp.toIso8601String(),
        "updated_timestamp": updatedTimestamp.toIso8601String(),
      };
}

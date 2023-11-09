class Entry{
  final int? id;
  final double amount;
  final String category;
  final String? createdAt;
 

  Entry({this.id, required this.amount,required this.category, this.createdAt});

  factory Entry.fromJson(Map<String,dynamic> json) => Entry(
    id: json['id'],
    amount: json['amount'],
    category: json['category'],
    createdAt: json['createdAt']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'category': category,
    'createdAt': createdAt
  };

  String toString()
  {
    return category;
  }
}
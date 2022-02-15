class Transaction {
  final String? id, title;
  final double? amount;
  final DateTime? date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  static List<Transaction> getList() {
    return [
      Transaction(
        id: "t1",
        title: "Soup",
        amount: 200,
        date: DateTime.now(),
      ),
      Transaction(
        id: "t1",
        title: "Soup",
        amount: 200,
        date: DateTime.now(),
      ),
      Transaction(
        id: "t1",
        title: "Soup",
        amount: 200,
        date: DateTime.now(),
      ),
      Transaction(
        id: "t1",
        title: "Soup",
        amount: 200,
        date: DateTime.now(),
      )
    ];
  }
}

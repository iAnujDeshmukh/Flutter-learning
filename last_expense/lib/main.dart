import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Expense Tracker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Category> categories = [
    Category('Food', '🍔', Colors.orange),
    Category('Transport', '🚌', Colors.blue),
    Category('Shopping', '🛍️', Colors.pink),
    Category('Other', '📦', Colors.green),
  ];

  final Map<String, List<Map<String, String>>> expenses = {
    'Food': [
      {'name': 'Pizza🍕', 'amount': '200'},
      {'name': 'Burger🍔', 'amount': '150'},
    ],
    'Transport': [
      {'name': 'Bus Ticket🚌', 'amount': '50'},
      {'name': 'Train Ticket🚂', 'amount': '120'},
    ],
    'Shopping': [
      {'name': 'Clothes🧥', 'amount': '800'},
      {'name': 'Shoes👞', 'amount': '500'},
    ],
    'Other': [
      {'name': 'Movie Ticket🎫', 'amount': '300'},
      {'name': 'Snacks🍟', 'amount': '100'},
    ],
  };

  final List<Map<String, String>> recentExpenses = [
    {'category': 'Food', 'name': 'Pizza', 'amount': '200'},
    {'category': 'Transport', 'name': 'Train Ticket', 'amount': '120'},
    {'category': 'Shopping', 'name': 'Shoes', 'amount': '500'},
    {'category': 'Other', 'name': 'Movie Ticket', 'amount': '300'},
  ];

  double getTotalExpense(String category) {
    return expenses[category]?.fold(0.0, (sum, expense) {
          final amount = double.tryParse(expense['amount'] ?? '0') ?? 0.0;
          return sum! + amount;
        }) ??
        0.0;
  }

  double getTotalExpenses() {
    return categories.fold(
        0.0, (sum, category) => sum + getTotalExpense(category.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Card(
                color: Colors.blue[100],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total Expenses: ₹${getTotalExpenses().toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryDetailScreen(
                              category: category,
                              expenses: expenses[category.name]!,
                              onAddExpense: (expense) {
                                setState(() {
                                  expenses[category.name]!.add(expense);
                                  recentExpenses.insert(0, {
                                    'category': category.name,
                                    'name': expense['name']!,
                                    'amount': expense['amount']!,
                                  });
                                  if (recentExpenses.length > 10) {
                                    recentExpenses.removeLast();
                                  }
                                });
                              }),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: category.color.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            category.emoji,
                            style: TextStyle(fontSize: 40),
                          ),
                          SizedBox(height: 10),
                          Text(
                            category.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '₹${getTotalExpense(category.name).toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Recent Expenses:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: recentExpenses.length,
                itemBuilder: (context, index) {
                  final expense = recentExpenses[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(expense['name']!),
                      subtitle: Text(expense['category']!),
                      trailing: Text(
                        '₹${expense['amount']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDetailScreen extends StatefulWidget {
  final Category category;
  final List<Map<String, String>> expenses;
  final Function(Map<String, String>) onAddExpense;

  const CategoryDetailScreen({
    super.key,
    required this.category,
    required this.expenses,
    required this.onAddExpense,
  });

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void addExpense() {
    final name = nameController.text;
    final amount = amountController.text;

    if (name.isNotEmpty && amount.isNotEmpty) {
      widget.onAddExpense({
        'name': name,
        'amount': amount,
      });
      nameController.clear();
      amountController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: widget.category.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Expenses:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.expenses.length,
                itemBuilder: (context, index) {
                  final expense = widget.expenses[index];
                  return Card(
                    child: ListTile(
                      title: Text(expense['name']!),
                      subtitle: Text('₹${expense['amount']}'),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Expense Name'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Amount'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addExpense,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final String emoji;
  final Color color;

  Category(this.name, this.emoji, this.color);
}

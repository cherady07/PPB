<<<<<<< HEAD
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());
=======
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
>>>>>>> 2e6d373879b1a34bc1dad04a141007987e36a25b

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      title: 'Flutter JSON Fetch',
      home: const TodoListScreen(),
=======
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentScreen(),
>>>>>>> 2e6d373879b1a34bc1dad04a141007987e36a25b
    );
  }
}

<<<<<<< HEAD
class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((todo) => Todo.fromJson(todo)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Todo')),
      body: FutureBuilder<List<Todo>>(
        future: fetchTodos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final todo = snapshot.data![index];
                return Card(
                  elevation: 3, // Memberikan efek bayangan
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        todo.id.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      todo.title,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(
                      todo.completed
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: todo.completed ? Colors.green : Colors.grey,
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
=======
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List menu dengan penyesuaian warna & ikon agar mirip gambar asli
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.water, 'label': 'Water', 'color': const Color(0xFF4FC3F7)},
      {
        'icon': Icons.lightbulb,
        'label': 'Electricity',
        'color': const Color(0xFFFFB300)
      },
      {
        'icon': Icons.local_fire_department,
        'label': 'Gas',
        'color': const Color(0xFFFF5722)
      },
      {
        'icon': Icons.shopping_bag,
        'label': 'Shopping',
        'color': const Color(0xFFE91E63)
      },
      {
        'icon': Icons.phone_android,
        'label': 'Phone',
        'color': const Color(0xFF1565C0)
      },
      {
        'icon': Icons.credit_card,
        'label': 'Credit Card',
        'color': const Color(0xFF00796B)
      },
      {
        'icon': Icons.shield,
        'label': 'Insurance',
        'color': const Color(0xFF00695C)
      },
      {
        'icon': Icons.home,
        'label': 'Mortgage',
        'color': const Color(0xFF7E57C2)
      },
      {
        'icon': Icons.description,
        'label': 'Other Bills',
        'color': const Color(0xFF546E7A)
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ================= HEADER SECTION =================
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              color: const Color(0xFF1A447B), // Warna biru navy
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu,
                            color: Colors.white, size: 28),
                        onPressed: () {},
                      ),
                      const Text(
                        'PAYMENT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings,
                            color: Colors.white, size: 26),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Color(0xFF1A447B),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BALANCE',
                            style: TextStyle(
                              color: Colors.blue[200],
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '\$4,180.20',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),

            // ================= GRID MENU SECTION =================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 10),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: menuItems.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: menuItems[index]['color'],
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  menuItems[index]['icon'],
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                menuItems[index]['label'],
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'more >>',
                          style: TextStyle(
                            color: Color(0xFF29B6F6),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
>>>>>>> 2e6d373879b1a34bc1dad04a141007987e36a25b
      ),
    );
  }
}

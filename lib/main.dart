import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Builder Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListViewPage(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({
    super.key,
  });

  @override
  State<ListViewPage> createState() => _MyListState();
}

TextEditingController textEditingController = TextEditingController();

class _MyListState extends State<ListViewPage> {
  List<String> fruit = ["Apple", "Banana", "Oranges"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 247, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 87, 165, 230),
        title: const Text("List View Builder Demo"),
        actions: [
          IconButton(
              onPressed: () {
                addList(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: fruit.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(fruit[index]),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      fruit.removeAt(index);
                    });
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            );
          }),
    );
  }

  void addList(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add a Fruit"),
          content: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter fruit name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (textEditingController.text.trim().isNotEmpty) {
                    fruit.add(textEditingController.text.trim());
                    textEditingController.clear();
                  }
                });
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }
}

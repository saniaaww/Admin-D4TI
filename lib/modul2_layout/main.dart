import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard UI Layouting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // ================= CONTAINER =================
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Container",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ================= ROW =================
            const Text("Row"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.star, size: 40),
                Icon(Icons.favorite, size: 40),
                Icon(Icons.home, size: 40),
              ],
            ),

            const SizedBox(height: 30),

            // ================= COLUMN =================
            const SizedBox(height: 30),
            const Text("Column"),
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.orange,
                  child: const Center(
                    child: Text(
                      "Column 1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      "Column 2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            // ================= STACK =================
            const Text("Stack"),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.grey,
                ),
                const Text(
                  "Stack Text",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ================= GRIDVIEW =================
            const Text("GridView"),
            const SizedBox(height: 5),
            SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "Item ${index + 1}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 15),

            // ================= LISTVIEW =================
            const Text("ListView"),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text("List Item ${index + 1}"),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
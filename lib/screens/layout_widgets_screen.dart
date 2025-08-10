import 'package:flutter/material.dart';

class LayoutWidgetsScreen extends StatelessWidget {
  const LayoutWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('布局组件'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Row 行布局'),
            _buildRowExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('Column 列布局'),
            _buildColumnExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('Expanded 扩展组件'),
            _buildExpandedExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('Stack 层叠布局'),
            _buildStackExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('Wrap 换行布局'),
            _buildWrapExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('GridView 网格布局'),
            _buildGridViewExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('ListView 列表布局'),
            _buildListViewExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
    );
  }

  Widget _buildRowExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Row 行布局示例'),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.red,
                  child: const Center(
                    child: Text('1', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.green,
                  child: const Center(
                    child: Text('2', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.blue,
                  child: const Center(
                    child: Text('3', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.orange,
                  child: const Center(
                    child: Text('左', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.purple,
                  child: const Center(
                    child: Text('中', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.teal,
                  child: const Center(
                    child: Text('右', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumnExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Column 列布局示例'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.red,
                        child: const Center(
                          child: Text('A', style: TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.green,
                        child: const Center(
                          child: Text('B', style: TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.blue,
                        child: const Center(
                          child: Text('C', style: TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.orange,
                        child: const Center(
                          child: Text('D', style: TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Expanded 扩展组件示例'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    color: Colors.red,
                    child: const Center(
                      child: Text('1:1', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 60,
                    color: Colors.green,
                    child: const Center(
                      child: Text('2:1', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 60,
                    color: Colors.blue,
                    child: const Center(
                      child: Text('3:1', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 60,
                  color: Colors.orange,
                  child: const Center(
                    child: Text('固定', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.purple,
                    child: const Center(
                      child: Text('扩展', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStackExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Stack 层叠布局示例'),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text('1', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 20,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text('2', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    bottom: 20,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text('3', style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWrapExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Wrap 换行布局示例'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildChip('Flutter', Colors.blue),
                _buildChip('Dart', Colors.green),
                _buildChip('Widget', Colors.orange),
                _buildChip('Material', Colors.purple),
                _buildChip('Cupertino', Colors.teal),
                _buildChip('StatefulWidget', Colors.red),
                _buildChip('StatelessWidget', Colors.indigo),
                _buildChip('BuildContext', Colors.pink),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      label: Text(label, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
    );
  }

  Widget _buildGridViewExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('GridView 网格布局示例'),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
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

  Widget _buildListViewExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('ListView 列表布局示例'),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.primaries[index % Colors.primaries.length],
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text('列表项 ${index + 1}'),
                    subtitle: Text('这是第 ${index + 1} 个列表项的描述'),
                    trailing: const Icon(Icons.arrow_forward_ios),
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
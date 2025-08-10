import 'package:flutter/material.dart';

class StateManagementScreen extends StatefulWidget {
  const StateManagementScreen({super.key});

  @override
  State<StateManagementScreen> createState() => _StateManagementScreenState();
}

class _StateManagementScreenState extends State<StateManagementScreen> {
  int _counter = 0;
  String _selectedItem = '选项1';
  bool _isLoading = false;
  List<String> _items = ['苹果', '香蕉', '橙子', '葡萄'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('状态管理'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('setState 状态管理'),
            _buildSetStateExample(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('计数器示例'),
            _buildCounterExample(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('列表状态管理'),
            _buildListStateExample(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('表单状态管理'),
            _buildFormStateExample(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('异步状态管理'),
            _buildAsyncStateExample(),
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
        color: Colors.red,
      ),
    );
  }

  Widget _buildSetStateExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('setState 是 Flutter 中最基本的状态管理方式'),
            const SizedBox(height: 16),
            const Text(
              '当调用 setState() 时，Flutter 会重新构建 widget，从而更新 UI。',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  child: const Text('增加'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter--;
                    });
                  },
                  child: const Text('减少'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = 0;
                    });
                  },
                  child: const Text('重置'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              '当前计数: $_counter',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('计数器状态管理示例'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('简单计数器'),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$_counter',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('带样式的计数器'),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red[400]!, Colors.orange[400]!],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        '$_counter',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListStateExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('列表状态管理示例'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _items.add('新项目 ${_items.length + 1}');
                      });
                    },
                    child: const Text('添加项目'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _items.isNotEmpty
                        ? () {
                            setState(() {
                              _items.removeLast();
                            });
                          }
                        : null,
                    child: const Text('删除项目'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('当前列表项目:'),
            const SizedBox(height: 8),
            Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.primaries[index % Colors.primaries.length],
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(_items[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _items.removeAt(index);
                        });
                      },
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

  Widget _buildFormStateExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('表单状态管理示例'),
            const SizedBox(height: 16),
            const Text('下拉选择框:'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: _selectedItem,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: '选项1', child: Text('选项1')),
                DropdownMenuItem(value: '选项2', child: Text('选项2')),
                DropdownMenuItem(value: '选项3', child: Text('选项3')),
                DropdownMenuItem(value: '选项4', child: Text('选项4')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedItem = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            Text('当前选择: $_selectedItem'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('开关状态: '),
                Switch(
                  value: _isLoading,
                  onChanged: (value) {
                    setState(() {
                      _isLoading = value;
                    });
                  },
                ),
                Text(_isLoading ? '开启' : '关闭'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAsyncStateExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('异步状态管理示例'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      setState(() {
                        _isLoading = true;
                      });
                      
                      // 模拟异步操作
                      await Future.delayed(const Duration(seconds: 2));
                      
                      setState(() {
                        _isLoading = false;
                        _counter += 10;
                      });
                      
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('异步操作完成！')),
                        );
                      }
                    },
              child: _isLoading
                  ? const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 8),
                        Text('处理中...'),
                      ],
                    )
                  : const Text('执行异步操作'),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(width: 16),
                      Text('正在执行异步操作，请稍候...'),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              '异步状态管理要点:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('• 使用 setState 更新 UI 状态'),
            const Text('• 处理加载状态显示'),
            const Text('• 异步操作完成后更新状态'),
            const Text('• 注意 widget 的生命周期'),
          ],
        ),
      ),
    );
  }
} 
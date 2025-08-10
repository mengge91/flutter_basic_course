import 'package:flutter/material.dart';

class InputWidgetsScreen extends StatefulWidget {
  const InputWidgetsScreen({super.key});

  @override
  State<InputWidgetsScreen> createState() => _InputWidgetsScreenState();
}

class _InputWidgetsScreenState extends State<InputWidgetsScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;
  String _selectedRadio = '选项1';
  double _sliderValue = 50.0;
  bool _switchValue = false;
  String _selectedDropdown = '选项1';

  @override
  void dispose() {
    _textController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('输入组件'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('文本输入框 (TextField)'),
            _buildTextFieldExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('按钮组件 (Button)'),
            _buildButtonExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('选择组件'),
            _buildSelectionExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('滑块和开关'),
            _buildSliderAndSwitchExamples(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('表单示例'),
            _buildFormExample(),
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
        color: Colors.orange,
      ),
    );
  }

  Widget _buildTextFieldExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('普通文本输入框'),
            const SizedBox(height: 8),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: '请输入文本',
                hintText: '这是一个提示文本',
                prefixIcon: Icon(Icons.text_fields),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('密码输入框'),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '请输入密码',
                hintText: '请输入您的密码',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('多行文本输入框'),
            const SizedBox(height: 8),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: '请输入多行文本',
                hintText: '这是一个多行文本输入框',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('按钮组件示例'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('您点击了主要按钮')),
                      );
                    },
                    child: const Text('主要按钮'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('您点击了轮廓按钮')),
                      );
                    },
                    child: const Text('轮廓按钮'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('您点击了文本按钮')),
                      );
                    },
                    child: const Text('文本按钮'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('您点击了图标按钮')),
                      );
                    },
                    icon: const Icon(Icons.favorite),
                    label: const Text('图标按钮'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('您点击了全宽按钮')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text('全宽按钮'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('选择组件示例'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('复选框: '),
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                Text(_isChecked ? '已选中' : '未选中'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('单选按钮:'),
            const SizedBox(height: 8),
            Column(
              children: [
                Radio<String>(
                  value: '选项1',
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
                const Text('选项1'),
                Radio<String>(
                  value: '选项2',
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
                const Text('选项2'),
                Radio<String>(
                  value: '选项3',
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
                const Text('选项3'),
              ],
            ),
            const SizedBox(height: 16),
            const Text('下拉选择框:'),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: _selectedDropdown,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: '选项1', child: Text('选项1')),
                DropdownMenuItem(value: '选项2', child: Text('选项2')),
                DropdownMenuItem(value: '选项3', child: Text('选项3')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedDropdown = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderAndSwitchExamples() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('滑块和开关示例'),
            const SizedBox(height: 16),
            const Text('滑块:'),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            Text('当前值: ${_sliderValue.round()}'),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('开关: '),
                Switch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                Text(_switchValue ? '开启' : '关闭'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('表单示例'),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: '用户名',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '密码',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text('我同意用户协议'),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('表单提交成功！')),
                  );
                },
                child: const Text('提交'),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
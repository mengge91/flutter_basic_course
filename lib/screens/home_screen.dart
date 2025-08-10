import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter基础课程'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '欢迎学习Flutter基础课程！',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              '本课程将带您学习Flutter的各种基础组件和概念',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuCard(
                    context,
                    '基础组件',
                    Icons.widgets,
                    Colors.blue,
                    '/basic_widgets',
                    'Text, Image, Icon等基础组件',
                  ),
                  _buildMenuCard(
                    context,
                    '布局组件',
                    Icons.grid_on,
                    Colors.green,
                    '/layout_widgets',
                    'Row, Column, Stack等布局组件',
                  ),
                  _buildMenuCard(
                    context,
                    '输入组件',
                    Icons.input,
                    Colors.orange,
                    '/input_widgets',
                    'TextField, Button等输入组件',
                  ),
                  _buildMenuCard(
                    context,
                    '导航',
                    Icons.navigation,
                    Colors.purple,
                    '/navigation',
                    '页面导航和路由管理',
                  ),
                                          _buildMenuCard(
                          context,
                          '状态管理',
                          Icons.settings,
                          Colors.red,
                          '/state_management',
                          'setState, Provider等状态管理',
                        ),
                  _buildMenuCard(
                    context,
                    '动画',
                    Icons.animation,
                    Colors.teal,
                    '/animation',
                    '基础动画和过渡效果',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String route,
    String description,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: color,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
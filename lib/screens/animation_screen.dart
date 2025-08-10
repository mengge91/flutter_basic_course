import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _slideController;
  late AnimationController _rotationController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotationAnimation;

  bool _isExpanded = false;
  double _customAnimationValue = 0.0;

  @override
  void initState() {
    super.initState();
    
    // 淡入淡出动画
    _fadeController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    // 缩放动画
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    // 滑动动画
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.bounceOut,
    ));

    // 旋转动画
    _rotationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _slideController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动画示例'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('淡入淡出动画 (Fade)'),
            _buildFadeAnimation(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('缩放动画 (Scale)'),
            _buildScaleAnimation(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('滑动动画 (Slide)'),
            _buildSlideAnimation(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('旋转动画 (Rotation)'),
            _buildRotationAnimation(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('展开收起动画'),
            _buildExpansionAnimation(),
            
            const SizedBox(height: 24),
            _buildSectionTitle('自定义动画'),
            _buildCustomAnimation(),
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
        color: Colors.teal,
      ),
    );
  }

  Widget _buildFadeAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('淡入淡出动画效果'),
            const SizedBox(height: 16),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    '淡入淡出',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _fadeController.forward();
                  },
                  child: const Text('淡入'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _fadeController.reverse();
                  },
                  child: const Text('淡出'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _fadeController.repeat();
                  },
                  child: const Text('循环'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScaleAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('缩放动画效果'),
            const SizedBox(height: 16),
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    '缩放',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _scaleController.forward();
                  },
                  child: const Text('放大'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _scaleController.reverse();
                  },
                  child: const Text('缩小'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _scaleController.repeat();
                  },
                  child: const Text('循环'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlideAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('滑动动画效果'),
            const SizedBox(height: 16),
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    '滑动',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _slideController.forward();
                  },
                  child: const Text('滑入'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _slideController.reverse();
                  },
                  child: const Text('滑出'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _slideController.repeat();
                  },
                  child: const Text('循环'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRotationAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('旋转动画效果'),
            const SizedBox(height: 16),
            RotationTransition(
              turns: _rotationAnimation,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    '旋转',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _rotationController.forward();
                  },
                  child: const Text('旋转'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _rotationController.reverse();
                  },
                  child: const Text('反向'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _rotationController.repeat();
                  },
                  child: const Text('循环'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('展开收起动画效果'),
            const SizedBox(height: 16),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              width: double.infinity,
              height: _isExpanded ? 200 : 100,
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  _isExpanded ? '展开状态' : '收起状态',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(_isExpanded ? '收起' : '展开'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('自定义动画效果'),
            const SizedBox(height: 16),
            AnimatedBuilder(
              animation: _fadeController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    _customAnimationValue * 100,
                    _fadeController.value * 50,
                  ),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(_fadeController.value),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Slider(
              value: _customAnimationValue,
              min: -1.0,
              max: 1.0,
              onChanged: (value) {
                setState(() {
                  _customAnimationValue = value;
                });
              },
            ),
            Text('水平偏移: ${_customAnimationValue.toStringAsFixed(2)}'),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _fadeController.forward();
                  },
                  child: const Text('开始动画'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _fadeController.reverse();
                  },
                  child: const Text('反向动画'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 
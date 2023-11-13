import 'package:flutter/material.dart';

class RIIZEmembers extends StatefulWidget {
  @override
  _RIIZEmembersState createState() => _RIIZEmembersState();
}

class _RIIZEmembersState extends State<RIIZEmembers> {
  final List<String> imagePaths = [
    'assets/images/r1.jpg',
    'assets/images/r2.jpg',
    'assets/images/r3.jpg',
    'assets/images/r4.jpg',
    'assets/images/r5.jpg',
    'assets/images/r6.jpg',
    'assets/images/r7.jpg',
    'assets/images/r8.jpg',
    'assets/images/r9.jpg',
    'assets/images/r10.jpg',
    'assets/images/r11.jpg',
    'assets/images/r12.jpg',
    'assets/images/r13.jpg',
    'assets/images/r14.jpg',
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('RIIZE MEMBERS')),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return _buildImagePage(imagePaths[index]);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),//ไอคอนที่กดเลื่อนรูปกลับ
                onPressed: () {
                  if (_pageController.page! > 0) {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),//ไอคอนที่กดเลื่อนรูปไปด้านหน้า
                onPressed: () {
                  if (_pageController.page! < imagePaths.length - 1) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImagePage(String imagePath) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(imagePath),
              width: 800,
              height: 550,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

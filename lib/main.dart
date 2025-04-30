import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GalleryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GalleryPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://picsum.photos/id/1011/200/200',
    'https://picsum.photos/id/1012/200/200',
    'https://picsum.photos/id/1013/200/200',
    'https://picsum.photos/id/1014/200/200',
    'https://picsum.photos/id/1015/200/200',
    'https://picsum.photos/id/1016/200/200',
    'https://picsum.photos/id/1018/200/200',
    'https://picsum.photos/id/1019/200/200',
    'https://picsum.photos/id/1020/200/200',
  ];

  final List<String> description = [
    'Beautiful Sunset over the mountains.',
    'A peaceful lake surrounded by trees.',
    'A road to the future with a bright sky.',
    'A forest trail perfect for hiking.',
    'Urban cityscape at night.',
    'A cozy winter cabin in the snow.',
    'Vibrant autumn leaves in the park.',
    'Stunning view of the ocean from the cliffs.',
    'A beautiful flower garden in full bloom.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text('My Gallery'),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 3 holeo chhoto screen e compressed hoye jabe
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75, // Ei ratio image + text show korar jonne
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit.cover,
                      height: 100,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    description[index],
                    style: TextStyle(color: Colors.white, fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.save, color: Colors.white, size: 20),
                      Icon(Icons.delete, color: Colors.white, size: 20),
                      Icon(Icons.share, color: Colors.white, size: 20),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

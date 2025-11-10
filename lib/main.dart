//Link GPT: https://chatgpt.com/share/6911c978-7be8-800e-89d3-212ce9952e56
import 'package:flutter/material.dart';

void main() {
  runApp(const MiniInstagramApp());
}

class MiniInstagramApp extends StatelessWidget {
  const MiniInstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Instagram - Ririn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: false),
      home: const InstagramHomePage(),
    );
  }
}

class InstagramHomePage extends StatefulWidget {
  const InstagramHomePage({super.key});

  @override
  State<InstagramHomePage> createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  int _selectedIndex = 0;

  // daftar story dengan nama dan foto profil
  final List<Map<String, String>> stories = [
    {'name': 'Jamal', 'image': 'https://picsum.photos/seed/jamal/200'},
    {'name': 'Asep', 'image': 'https://picsum.photos/seed/asep/200'},
    {'name': 'Munaro', 'image': 'https://picsum.photos/seed/munaro/200'},
    {'name': 'Ningsi', 'image': 'https://picsum.photos/seed/ningsi/200'},
    {'name': 'Sara', 'image': 'https://picsum.photos/seed/sara/200'},
    {'name': 'Ajep', 'image': 'https://picsum.photos/seed/ajep/200'},
    {'name': 'Dedi', 'image': 'https://picsum.photos/seed/dedi/200'},
    {'name': 'Ratu', 'image': 'https://picsum.photos/seed/ratu/200'},
  ];

  // daftar postingan
  final List<Map<String, String>> posts = [
    {
      'user': 'Jamal',
      'profile': 'https://picsum.photos/seed/jamal/200',
      'image': 'https://picsum.photos/seed/post1/800',
      'likes': 'Disukai oleh Asep dan 3.2rb lainnya',
      'caption': 'Pagi yang tenang, secangkir kopi ☕✨'
    },
    {
      'user': 'Asep',
      'profile': 'https://picsum.photos/seed/asep/200',
      'image': 'https://picsum.photos/seed/post2/800',
      'likes': 'Disukai oleh Jamal dan 1.1rb lainnya',
      'caption': 'Jalan-jalan sore, liat kota dari atas 🌇'
    },
    {
      'user': 'Munaro',
      'profile': 'https://picsum.photos/seed/munaro/200',
      'image': 'https://picsum.photos/seed/post3/800',
      'likes': 'Disukai oleh Ningsi dan 980 lainnya',
      'caption': 'Eksperimen warna untuk project desain 🎨'
    },
    {
      'user': 'Ningsi',
      'profile': 'https://picsum.photos/seed/ningsi/200',
      'image': 'https://picsum.photos/seed/post4/800',
      'likes': 'Disukai oleh Sara dan 2.5rb lainnya',
      'caption': 'Senja di pantai bikin rileks 🌊'
    },
    {
      'user': 'Sara',
      'profile': 'https://picsum.photos/seed/sara/200',
      'image': 'https://picsum.photos/seed/post5/800',
      'likes': 'Disukai oleh Ajep dan 640 lainnya',
      'caption': 'Library day — baca sedikit, ngopi banyak 📚☕'
    },
    {
      'user': 'Ajep',
      'profile': 'https://picsum.photos/seed/ajep/200',
      'image': 'https://picsum.photos/seed/post6/800',
      'likes': 'Disukai oleh Dedi dan 430 lainnya',
      'caption': 'Menuju puncak! perjalanan + tawa = kenyang hati 🏔️'
    },
  ];

  Widget _buildStoriesBar() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final s = stories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(colors: [Colors.purple, Colors.orange]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      radius: 34,
                      backgroundImage: NetworkImage(s['image']!),
                      backgroundColor: Colors.grey[800],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 70,
                  child: Text(
                    s['name']!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPost(Map<String, String> post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(post['profile']!)),
          title: Text(post['user']!),
          trailing: const Icon(Icons.more_vert),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            post['image']!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey[900],
                child: const Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[900],
              child: const Center(child: Icon(Icons.broken_image)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: const [
              Icon(Icons.favorite_border),
              SizedBox(width: 18),
              Icon(Icons.comment_outlined),
              SizedBox(width: 18),
              Icon(Icons.send_outlined),
              Spacer(),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            post['likes']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 16),
          child: Text('${post['user']}: ${post['caption']}'),
        ),
      ],
    );
  }

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Menu index: $index ditekan (contoh)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram', style: TextStyle(fontFamily: 'Billabong', fontSize: 30)),
        actions: const [
          Icon(Icons.add_box_outlined),
          SizedBox(width: 8),
          Icon(Icons.favorite_border),
          SizedBox(width: 8),
        ],
      ),
      body: ListView(
        children: [
          _buildStoriesBar(),
          const Divider(height: 1),
          ...posts.map((p) => _buildPost(p)).toList(),
          const SizedBox(height: 60),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

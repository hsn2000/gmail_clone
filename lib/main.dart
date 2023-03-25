import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gmail Clone',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GmailHomePage(),
    );
  }
}

class GmailHomePage extends StatefulWidget {
  @override
  _GmailHomePageState createState() => _GmailHomePageState();
}

class _GmailHomePageState extends State<GmailHomePage> {
  final List<Map<String, dynamic>> _inbox = [
    {
      'from': 'Facebook',
      'subject': 'You have 10 new friend requests',
      'body': 'Hi, You have 10 new friend requests. Check them out now.',
      'time': '8:30 AM',
      'read': false,
    },
    {
      'from': 'Twitter',
      'subject': 'See what\'s happening today',
      'body': 'Hello, There\'s a lot happening on Twitter today. Check it out now.',
      'time': '10:00 AM',
      'read': false,
    },
    {
      'from': 'LinkedIn',
      'subject': 'Your profile is trending on LinkedIn',
      'body': 'Hi, Your profile is trending on LinkedIn. Check it out now.',
      'time': '12:00 PM',
      'read': true,
    },
    {
      'from': 'YouTube',
      'subject': 'New video recommendation for you',
      'body': 'Hello, There\'s a new video recommendation for you on YouTube. Check it out now.',
      'time': '2:00 PM',
      'read': false,
    },
    {
      'from': 'GitHub',
      'subject': 'Your pull request has been merged',
      'body': 'Hi, Your pull request has been merged. Check it out now.',
      'time': '4:00 PM',
      'read': true,
    },
    {
      'from': 'Medium',
      'subject': 'Recommended reading for you',
      'body': 'Hello, There\'s some recommended reading for you on Medium. Check it out now.',
      'time': '6:00 PM',
      'read': false,
    },
  ];

  Map<String, dynamic> _selectedEmail = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Primary'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _inbox.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _inbox[index]['read'] = true;
                      _selectedEmail = _inbox[index];
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    color: _inbox[index]['read'] ? Colors.white : Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _inbox[index]['from'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                _inbox[index]['subject'],
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                _inbox[index]['body'],
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              _inbox[index]['time'],
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            _inbox[index]['read']
                                ? SizedBox.shrink()
                                : Container(
                                    width: 10.0,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:myntrahack_app/screens/homescreen.dart';

void main() async {

  final client = StreamChatClient(
    'b67pax5b2wdq',
    logLevel: Level.INFO,
  );

  await client.connectUser(
    User(id: 'tutorial-flutter'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',
  );

  runApp(
    MyApp(
      client: client,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => StreamChat(
        client: client,
        child: child,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => MyHomePage(),
        "/chat": (context) => const ChannelListPage(),
      },
    );
  }
}

class ChannelListPage extends StatelessWidget {
  const ChannelListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChannelsBloc(
        child: ChannelListView(
          filter: Filter.in_(
            'members',
            [StreamChat.of(context).currentUser!.id],
          ),
          sort: const [SortOption('last_message_at')],
          limit: 20,
          channelWidget: const ChannelPage(),
        ),
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChannelHeader(),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: MessageListView(),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}




//////////////////////////////----------------- SIDE NAVBAR
// import 'package:flutter/material.dart';

// void main() {
//   runApp(App());
// }

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Sidenav',
//       theme: ThemeData(
//         //
//         primarySwatch: Colors.red,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   int navIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sidenav app')),
//       drawer: Sidenav(navIndex, (int index) {
//         setState(() {
//           navIndex = index;
//         });
//       }),

//       body: Builder(
//         builder: (context) {
//           switch (navIndex) {
//             case 0:
//               return Center(child: Text('Men'));
//             case 1:
//               return Center(child: Text('Women'));
//             case 2:
//               return Center(child: Text('Kids'));
//             case 3:
//               return Center(child: Text('Beauty'));
//             case 4:
//               return Center(child: Text('Myntra Socials'));
//             case 5:
//               return Center(child: Text('Myntra Studio'));
//             case 6:
//               return Center(child: Text('Myntra Mall'));
//             case 7:
//               return Center(child: Text('Contact Us'));
//             default:
//               return Center(child: Text('FAQs'));
//           }
//         },
//       ),
//     );
//   }
// }

// class Sidenav extends StatelessWidget {

//   final Function setIndex;
//   final int selectedIndex;

//   Sidenav(this.selectedIndex, this.setIndex );

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text('Gmail', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 21)),
//           ),

//           Divider(color: Colors.grey.shade400),

//           _navItem(context, Icons.move_to_inbox, 'Men',
//             onTap: () { _navItemClicked(context, 0); },
//             selected: selectedIndex == 0
//           ),

//           Divider(color: Colors.grey.shade400),

//           _navItem(context, Icons.inbox, 'Women',
//             suffix: Text('28',style: TextStyle(fontWeight: FontWeight.w500),),
//             onTap: () { _navItemClicked(context, 1); },
//             selected: selectedIndex == 1
//           ),

//           _navItem(context, Icons.group, 'Kids',
//             suffix: Text('28',style: TextStyle(fontWeight: FontWeight.w500),),
//             onTap: () { _navItemClicked(context, 2); },
//             selected: selectedIndex == 2
//           ),

//           _navItem(context, Icons.local_offer, 'Beauty',
//             suffix: Text('28',style: TextStyle(fontWeight: FontWeight.w500),),
//             onTap: () { _navItemClicked(context, 3); },
//             selected: selectedIndex == 3
//           ),

//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text('ALL LABELS', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700, letterSpacing: 1)),
//           ),

//           _navItem(context, Icons.star_border, 'Myntra Socials',
//             onTap: () { _navItemClicked(context, 4); },
//             selected: selectedIndex == 4
//           ),
          
//           _navItem(context, Icons.schedule, 'Myntra Studio',
//             onTap: () { _navItemClicked(context, 5); },
//             selected: selectedIndex == 5
//           ),

//           _navItem(context, Icons.label_important, 'Myntra Mall',
//             onTap: () { _navItemClicked(context, 6); },
//             selected: selectedIndex == 6
//           ),

//           _navItem(context, Icons.send, 'Contact Us',
//             onTap: () { _navItemClicked(context, 7); },
//             selected: selectedIndex == 7
//           ),
//         ],
//       ),
//     );
//   }

//   _navItem(BuildContext context, IconData icon, String text, {Text? suffix, Function? onTap, bool selected = false}) => Container(
//     color: selected ? Colors.grey.shade300 : Colors.transparent,
//     child: ListTile(
//       leading: Icon(icon, color: selected ? Theme.of(context).primaryColor : Colors.black),
//       trailing: suffix,
//       title: Text(text),
//       selected: selected,
//       onTap: null,
//     ),
//   );

//   _navItemClicked(BuildContext context, int index) {
//     setIndex(index);
//     Navigator.of(context).pop();
//   }
// }
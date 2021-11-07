import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myntrahack_app/item.dart';
import 'package:myntrahack_app/item_description.dart';
import 'package:myntrahack_app/widgets/channellistpage.dart';

// void main() {
//   runApp(MyApp()); 
// }

// class homescreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//       ),
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidenav(navIndex, (int index) {
        setState(() {
          navIndex = index;
        });
        
      }),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                        size: 28,
                      )
                    ),

                    Icon(
                      Icons.filter_list,
                      color: Colors.black,
                      size: 28,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 24.0,
              ),

              Text(
                "Myntra",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 16.0,
              ),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0, 
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(20),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 24.0, right: 16.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 16.0,
              ),

              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.5,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: getGridItems().map((item) => renderGridItem(item)).toList(),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget renderGridItem(Item item){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ItemDescription(item: item)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Text(
                item.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    r"$ " + item.price,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  
                ],
              ),

              SizedBox(
                height: 8.0,
              ),

              Expanded(
                child: Hero(
                  tag: item.title,
                  child: Image.asset(
                    item.imageUrl,
                  ),
                ),
              ),

              SizedBox(
                height: 8.0,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Add to cart",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.black,
                        size: 16,
                      )
                    ],
                  ),
                )
              )

            ],
          ),
        ),
      ),
    );
  }
}


class Sidenav extends StatelessWidget {

  final Function setIndex;
  final int selectedIndex;

  Sidenav(this.selectedIndex, this.setIndex );
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Myntra', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 21)),
          ),

    //       

          Divider(color: Colors.grey.shade400),

          _navItem(context, Icons.people, 'Socials',
            onTap: () { _navItemClicked(context, 0); },
            selected: selectedIndex == 0
          ),

          Divider(color: Colors.grey.shade400),

          _navItem(context, Icons.people, 'Women',
            suffix: Text('28',style: TextStyle(fontWeight: FontWeight.w500),),
            onTap: () { _navItemClicked(context, 1); },
            selected: selectedIndex == 1
          ),

          _navItem(context, Icons.people, 'Kids',
            suffix: Text('28',style: TextStyle(fontWeight: FontWeight.w500),),
            onTap: () { _navItemClicked(context, 2); },
            selected: selectedIndex == 2
          ),

          _navItem(context, Icons.people, 'Beauty',
            suffix: Text('28',style: TextStyle(fontWeight: FontWeight.w500),),
            onTap: () { _navItemClicked(context, 3); },
            selected: selectedIndex == 3
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Extras', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700, letterSpacing: 1)),
          ),

          _navItem(context, Icons.chat, 'Help',
          
            
            onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChannelListPage()),
                  );
                },
            selected: selectedIndex == 4
          ),
          
          _navItem(context, Icons.camera, 'Myntra Studio',
            onTap: () { _navItemClicked(context, 5); },
            selected: selectedIndex == 5
          ),

          _navItem(context, Icons.home, 'Myntra Mall',
            onTap: () { _navItemClicked(context, 6); },
            selected: selectedIndex == 6
          ),

          _navItem(context, Icons.star, 'Contact Us',
            onTap: () { _navItemClicked(context, 7); },
            selected: selectedIndex == 7
          ),
        ],
      ),
    );
  }

  _navItem(BuildContext context, IconData icon, String text, {Text? suffix, Function? onTap, bool selected = false}) => Container(
    color: selected ? Colors.grey.shade300 : Colors.transparent,
    child: ListTile(
      leading: Icon(icon, color: selected ? Theme.of(context).primaryColor : Colors.black),
      trailing: suffix,
      title: Text(text),
      selected: selected,
      onTap: null,
    ),
  );

  _navItemClicked(BuildContext context, int index) {
    setIndex(index);
    Navigator.of(context).pop();
  }
}

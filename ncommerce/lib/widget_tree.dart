import 'package:flutter/material.dart';
import 'package:ncommerce/components/bottom_nav_bar.dart';
import 'package:ncommerce/pages/cart_page.dart';
import 'package:ncommerce/pages/shop_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  //selected index that will update as the bottomnavber changes
  int _selectedIndex = 0;

  //method that updates the selectedIndex
  void onTabChange(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  void onLogout() async {
    Navigator.pop(context);
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, 'intropage');
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('shown', false);
  }

  final List<Widget> pageList = [ShopPage(), CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       icon: Icon(Icons.menu, color: Colors.black),
        //     );
        //   },
        // ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/applelogo.png', height: 30, width: 30),
            SizedBox(width: 5),
            Text('Apple'),
          ],
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: SafeArea(
          child: Column(
            children: [
              //space above
              SizedBox(height: 40),

              //logo
              Image.asset(
                'assets/images/applelogo.png',
                color: Colors.white,
                height: 100,
              ),

              //menu items
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text('Home', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text('About', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'aboutpage');
                  },
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text('Log out', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    onLogout();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: pageList[_selectedIndex],

      bottomNavigationBar: BottomNavBar(
        onTabChange: (value) {
          onTabChange(value);
        },
      ),
    );
  }
}

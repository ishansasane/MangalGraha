import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mangal_graha/homepage.dart';
import 'package:mangal_graha/profilepage.dart';
import 'package:mangal_graha/registerPage.dart';
import 'package:mangal_graha/shoppage.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    Homepage(),
    DonationPage(),
    Registerpage(),
    Profilepage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(
                255, 250, 100, 55), // Background color of the app bar
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20)), // Circular border radius
          ),
          child: AppBar(
            title: Text(
              'MangalGraha',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            automaticallyImplyLeading: false, // Prevents the back button
            backgroundColor:
                Colors.transparent, // Transparent app bar background
            elevation: 0, // No shadow for the app bar
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: SafeArea(
          child: GNav(
            rippleColor: Colors.orange[800]!,
            hoverColor: Colors.orange[600]!,
            haptic: true,
            tabBorderRadius: 25,
            tabActiveBorder: Border.all(color: Colors.deepOrange, width: 0),
            tabBorder: Border.all(color: Colors.grey, width: 1),
            tabShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
            ],
            curve: Curves.easeOutExpo,
            duration: Duration(milliseconds: 900),
            gap: 5,
            color: Colors.grey[800]!,
            activeColor: Colors.deepOrange,
            iconSize: 24,
            tabBackgroundColor: Colors.deepOrange.withOpacity(0.1),
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange[800],
                ),
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Darshan',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange[800],
                ),
              ),
              GButton(
                icon: Icons.read_more,
                text: 'Abhishek',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange[800],
                ),
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange[800],
                ),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              _onItemTapped(index);
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_appbar_conhecimento/tab_account_page.dart';
import 'package:flutter_appbar_conhecimento/tab_home_page.dart';
import 'package:flutter_appbar_conhecimento/tab_search_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int currentIndex = 0;
  var _pages = List<Widget>();
  PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget child) {
          return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
              BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Search")),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("Account")),
            ],
            currentIndex: _pageController.page == null ? 0 :_pageController.page.round(),
            onTap: (index) {
              _pageController.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.easeOutSine);
            },
          );
        },
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("moreirawebmaster@gmail.com"),
              accountName: Text("Thiago Moreira"),
              currentAccountPicture: CircleAvatar(
                child: Text("TM"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(child: Text("Show de bola")),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () {},
          )
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return _SelectedPage(index);
        },
      ),
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Text("T"),
            )
          : null,
    );
  }
}

class _SelectedPage extends StatelessWidget {
  int currentPageIndex;

  _SelectedPage(this.currentPageIndex);

  @override
  Widget build(BuildContext context) {
    switch (currentPageIndex) {
      case 0:
        return HomeWidth();
      case 1:
        return SearchPage();
      case 2:
        return AccountPage();
      default:
    }
  }
}

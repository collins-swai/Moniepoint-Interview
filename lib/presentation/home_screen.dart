import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:moniepoint/themes/app_style.dart';
import 'package:moniepoint/themes/color_constant.dart';
import 'package:moniepoint/widget/search_widget.dart';

class HomeScreen extends StatefulWidget {
  final String imagePath;
  final String text;

  const HomeScreen({Key? key, required this.imagePath, required this.text})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  Color _backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        int currentPage = _pageController.page!.round();
        _backgroundColor =
            currentPage % 2 == 0 ? Colors.white : Colors.pink[200]!;
      });
    });
  }

  Widget buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 12.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: _backgroundColor,
                padding: EdgeInsets.fromLTRB(16.0, 32.0, 106.0, 16.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        child: Image.asset('assets/images/search.png'),
                        width: 18,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 42.0,
                right: 26.0,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/shopping-bag.png",
                      height: 32,
                      width: 32,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/images/chat.png",
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 200.0,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.asset(
                            "assets/images/image${index + 1}.png",
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      Positioned(
                        top: 20.0,
                        left: 340.0,
                        right: 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return buildDot(index == _currentPage);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/category.png',
                              height: 30,
                            ),
                            Text("Category", style: AppStyle.txtInterMedium14Bluegray100,)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/flight-mode.png',
                              height: 30,
                            ),
                            Text("Flight", style: AppStyle.txtInterMedium14Bluegray100,)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/invoice.png',
                              height: 30,
                            ),
                            Text("Bill", style: AppStyle.txtInterMedium14Bluegray100,)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/internet.png',
                              height: 30,
                            ),
                            Text("Data Plan", style: AppStyle.txtInterMedium14Bluegray100,)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/euro.png',
                              height: 30,
                            ),
                            Text("Top Up", style: AppStyle.txtInterMedium14Bluegray100,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return buildDot(index == _currentPage);
                  }),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Scrolling Images and Texts',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(10, (index) {
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


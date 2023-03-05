import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/screens/introducation.dart';
import 'package:my_portfolio/screens/project.dart';
import 'package:my_portfolio/screens/skill.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> menuList = [
    const Introduction(),
    const Skill(),
    const Project(),
  ];

  int currentMenuIndex = 0;

  bool loading = true;
  double loadingOpacity = 1.0;

  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    _pageController = PageController();
    _timer = Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        loading = false;
      });
    });
    Future.delayed(const Duration(milliseconds: 1700), () {
      setState(() {
        loadingOpacity = 0.5;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.nunito(),
        ),
      ),
      home: loading
          ? Scaffold(
              backgroundColor: Colors.white,
              body: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: loadingOpacity),
                duration: const Duration(milliseconds: 300),
                builder: (BuildContext context, double value, Widget? child) {
                  return Opacity(
                    opacity: value,
                    child: Container(
                      color: Colors.blue.withOpacity(0.4),
                      child: Center(
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue.shade900,
                              width: 15.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'JSM',
                              style: GoogleFonts.dancingScript(
                                textStyle: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.blue.shade900,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 30.0,
                      offset: const Offset(10, 10),
                    )
                  ],
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  currentIndex: currentMenuIndex,
                  onTap: (index) {
                    setState(() {
                      currentMenuIndex = index;
                      _pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 450),
                          curve: Curves.fastOutSlowIn);
                    });
                  },
                  backgroundColor: Colors.blue.withOpacity(0.4),
                  selectedItemColor: Colors.blue.shade900,
                  unselectedItemColor: Colors.white,
                  unselectedLabelStyle: GoogleFonts.lato(
                    textStyle: const TextStyle(fontSize: 14.0),
                  ),
                  selectedLabelStyle: GoogleFonts.lato(
                    textStyle: const TextStyle(fontSize: 14.0),
                  ),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.perm_identity_rounded),
                      label: 'My Introduce',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.view_in_ar_outlined),
                      label: 'My Skill',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard),
                      label: 'My Project',
                    ),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: PageView(
                      controller: _pageController,
                      children: menuList,
                      onPageChanged: (index) {
                        setState(() {
                          currentMenuIndex = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

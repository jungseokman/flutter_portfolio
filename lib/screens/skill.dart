import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Skill extends StatefulWidget {
  const Skill({Key? key}) : super(key: key);

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  int _animatedText = 0;

  final List<Timer> _timer = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      Timer timer = Timer(Duration(milliseconds: 300 + (i * 500)), () {
        setState(() {
          _animatedText += 1;
        });
      });
      _timer.add(timer);
    }
  }

  @override
  void dispose() {
    for (var timer in _timer) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'My Skill',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              AnimatedOpacity(
                opacity: _animatedText > 0 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  children: [
                    Text(
                      'Position',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Publishing, Front-End',
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: _animatedText > 1 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Language',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Javascript, Dart',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: _animatedText > 2 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Framework / Library',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Flutter, React',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: _animatedText > 3 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'System',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'MySql',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: _animatedText > 4 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Tool',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Visual Studio Code, Android Studio, Git, Notion',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

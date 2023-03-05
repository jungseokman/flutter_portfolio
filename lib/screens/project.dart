import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/data/projects.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'My Project',
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
                height: 30.0,
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.only(bottom: 20),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  children: List.generate(
                    projects.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          context.push('/detail/$index');
                        },
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.grey.withOpacity(0.2),
                          child: Image.asset(
                            projects[index][0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

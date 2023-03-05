import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/data/projects.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailPage extends StatelessWidget {
  final String id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int detailIndex = int.parse(id);

    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        shadowColor: Colors.black.withOpacity(0.15),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: Text(
          projects[detailIndex][2],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    launchUrlString(projects[detailIndex][1],
                        mode: LaunchMode.externalApplication);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 20,
                          offset: const Offset(10, 10),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      projects[detailIndex][0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: projects[detailIndex][3],
                      style: const TextStyle(
                          color: Colors.black87, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff7AEBF2),
                        Color(0xff9887FE),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(10, 10),
                          blurRadius: 30,
                          color: Colors.black.withOpacity(0.15)),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      launchUrlString(projects[detailIndex][1],
                          mode: LaunchMode.externalApplication);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: Text(
                      '사이트 방문하기',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}

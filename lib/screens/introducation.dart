import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/widgets/wave_animation.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'My Introduce',
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
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black87, fontSize: 14.0),
                      children: [
                        TextSpan(text: '안녕하세요 :) 프론트엔드 개발자 '),
                        TextSpan(
                          text: '정석만',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: '입니다.'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(text: '저는 비전공자에 개발에 대한 지식이 전무했지만,\n'),
                        TextSpan(text: '문제를 고민하고 해결하는 것에 성취감을 느끼는 저에게\n'),
                        TextSpan(text: '개발라자는 직군이 적성에 맞고 끊임없이 성장해야하는\n'),
                        TextSpan(text: '매력에 빠져 공부를 시작하게 되었습니다.'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                            text: '개발 초반에는 Javascript / React 기반으로 학습하여\n'),
                        TextSpan(text: '이전의 회사에서 해당 기술을 기반으로 프론트엔드 개발을\n'),
                        TextSpan(text: '했지만, 앱 개발에 관한 관심과 Flutter의 장점에 매력을\n'),
                        TextSpan(text: '느껴서 공부하게 되었습니다.'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(text: '아직 많이 부족하지만, 이해와 성실을 바탕으로\n'),
                        TextSpan(text: '열정적인 배움의 자세로 빠르게 성장하여,\n'),
                        TextSpan(text: '프론트엔드뿐만 아니라 백엔드와 DB까지 배워서\n'),
                        TextSpan(text: '회사의 성장에 이바지할 수 있는 존재가 되겠습니다.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const WaveWidget(),
          ],
        ),
      ),
    );
  }
}

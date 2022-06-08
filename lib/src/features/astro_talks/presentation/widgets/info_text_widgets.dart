import 'package:astro_talk/src/core/colors.dart';
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          '''Seeking accurate answers to difficult questions
troubling your mind? Ask credible astrologers to know
what future has in store for you.''',
          style:
              textTheme.headline4?.copyWith(color: Colors.black, fontSize: 14),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.appOrangeColor.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '''
\u2022 Personalized responses provided by our tear of
Vedic astrologers within 24 hours
\u2022 Qualified and experienced astrologers will look
into your birth chart and provide the right
guidance
\u2022 You can seck answers to any part of your life and
for most pressing issues
\u2022 Our team of Vedic astrologers will not just p
answers but also suggest a remedial solution
            ''',
              style: textTheme.headline4
                  ?.copyWith(color: AppColors.appOrangeColor, fontSize: 14),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../provider/quiz_provider.dart';
import '../provider/timer_provider.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<TimerProvider>(context, listen: false)
        .initTimerForState(TIMER_STATE.tenSecondTimerState);
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Icon(
              Icons.cancel_outlined,
              color: Colors.white,
              size: 35,
            ),
            Container(
              height: height * 0.09,
              width: width * 0.2,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                border: BorderDirectional(),
              ),
              child: Center(
                child: Consumer<TimerProvider>(
                  builder: (_, timerProvider, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white60,
                            value: timerProvider.currentCountDownPercent,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Text(
                              timerProvider.time.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              width: size.width * 0.13,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/heart.svg",
                    width: 15,
                    color: Colors.white,
                  ),
                  Selector<QuizProvider, int>(
                    selector: (_, provider) {
                      return provider.life;
                    },
                    builder: (_, life, child) {
                      return Text(
                        life.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}

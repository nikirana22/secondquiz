import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/timer_provider.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<TimerProvider>(context, listen: false)
        .initTimerForState(TIMER_STATE.tenSecondTimerState);
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      height: height * 0.15,
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.cancel_outlined,
            color: Colors.white60,
            size: 35,
          ),
          Container(
            height: height * 0.09,
            width: width * 0.2,
            decoration: const BoxDecoration(
              // color: Colors.red,
              shape: BoxShape.circle,
              border: BorderDirectional(),
            ),
            child: Center(
              child: Consumer<TimerProvider>(
                builder: (_, timerProvider, child) {
                  return Text(
                    timerProvider.time.toString(),
                    style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ),
          Row(
            children: const [
              Icon(
                Icons.heart_broken,
                color: Colors.white70,
                size: 20,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '{quiz.life}',
                style: TextStyle(fontSize: 19, color: Colors.white70),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}

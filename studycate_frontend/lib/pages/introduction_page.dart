import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:studycate/constants.dart';
import 'package:studycate/widgets/btn.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _controller = PageController();
  final btnName = StateProvider<String>((ref) => "Continue");
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Text(
                "Skip",
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Consumer(builder: ((context, ref, child) {
            return PageView(
              controller: _controller,
              onPageChanged: (n) {
                if (n > 1) {
                  ref.read(btnName.notifier).update((state) => "Sign Up");
                } else {
                  ref.read(btnName.notifier).update((state) => "Continue");
                }
              },
              children: [
                Container(
                  color: bgColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/chat.png",
                        height: size.height * 0.2,
                      ),
                      SizedBox(height: size.height * 0.05),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width - 50),
                        child: const Text(
                          "Welcome to StudyCate",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width - 100),
                        child: const Text(
                          "Connect & collaborate with fellow students through group chat",
                          style: TextStyle(
                            fontSize: 17,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
                Container(
                  color: bgColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/chatBot.png",
                        height: size.height * 0.2,
                      ),
                      SizedBox(height: size.height * 0.05),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width - 100),
                        child: const Text(
                          "Quick AI Assistance",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width - 100),
                        child: const Text(
                          "Got questions or douts? Our AI Chatbot is here to help!",
                          style: TextStyle(
                            fontSize: 17,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
                Container(
                  color: bgColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/book.png",
                        height: size.height * 0.2,
                      ),
                      SizedBox(height: size.height * 0.05),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width - 50),
                        child: const Text(
                          "Let's get started!",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width - 100),
                        child: const Text(
                          "Explore exciting features to enhance your learning experience",
                          style: TextStyle(
                            fontSize: 17,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ],
            );
          })),
          Consumer(
            builder: (context, ref, child) {
              return Align(
                alignment: Alignment(0, 0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey.shade500,
                        activeDotColor: Colors.white,
                        dotHeight: size.height * 0.01,
                        dotWidth: 10,
                      ),
                      controller: _controller,
                      count: 3,
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width - 100,
                          child: Consumer(
                            builder: (context, ref, child) {
                              final name = ref.watch(btnName);
                              return Btn(
                                onTap: () {
                                  if (name == "Continue") {
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                  } else {
                                    Navigator.pushNamed(context, '/login');
                                    //Navigator.pushReplacementNamed(context, '/');
                                  }
                                },
                                text: name,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

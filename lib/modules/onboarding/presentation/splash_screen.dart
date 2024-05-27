import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    Future.delayed(const Duration(seconds: 5)).then((_) {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => NextScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(child: Image.asset('assets/images/splash_background.png')),
          Center(
              child: Image.asset(
            'assets/images/quick_solver.png',
            scale: 2,
          )),
          Positioned(
            bottom: 59,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: LinearProgressIndicator(
                        value: _animation.value,
                        minHeight: 16,
                        color: const Color(0xff064a0c),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    const Text(
                      'Launching your one stop solution to all\nscience and maths problems',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

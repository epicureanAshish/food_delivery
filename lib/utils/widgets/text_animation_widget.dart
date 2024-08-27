


import 'package:flutter/material.dart';

class TextHighlightAnimation extends StatefulWidget {
  @override
  _TextHighlightAnimationState createState() => _TextHighlightAnimationState();
}

class _TextHighlightAnimationState extends State<TextHighlightAnimation>
    with TickerProviderStateMixin {
  late AnimationController _textController;
  late AnimationController  _subtitleController;
  late Animation<int> _textAnimation;
  late Animation<double> _subtitleOpacity;

  final List<String> _texts = [
    'Food',
    'Instamart',
    'Dineout',
  ];

  final List<String> _subtitles = [
    'Order from top restaurants',
    'Fresh groceries in 10 mins',
    'Upto 40% off on dining bills',
  ];

  @override
  void initState() {
    super.initState();
    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(seconds: 9), // Duration for the text animation
      vsync: this,
    )..repeat();

    _textAnimation = IntTween(begin: 0, end: _texts.length - 1).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    )..addListener(() {
      setState(() {});
    });

    // Initialize subtitle animation controller
    _subtitleController = AnimationController(
      duration: const Duration(seconds: 3), // Duration for subtitle fade animation (total: fade-in + fade-out)
      vsync: this,
    )..repeat(reverse: true); // Repeat with reverse to handle fade-in and fade-out

    _subtitleOpacity = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0), // Fade in
        weight: 1.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1.0, end: 0.0), // Fade out
        weight: 1.0,
      ),
    ]).animate(CurvedAnimation(
      parent: _subtitleController,
      curve: Curves.easeInOut,
    ));

    // Synchronize subtitle opacity with text animation
    _textController.addListener(() {
      if (_textController.isAnimating) {
        if (_textController.value < 0.5) {
          _subtitleController.forward();
        } else if (_textController.value >= 0.5 && _textController.value < 1.0) {
          _subtitleController.reverse();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = _textAnimation.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: <Widget>[
            for (int i = 0; i < _texts.length; i++)
              _titleAndSeparator(i,currentIndex)
          ],
        ),
        const SizedBox(height: 10),
        Divider(),
        const SizedBox(height: 10),
        // AnimatedOpacity for the subtitle
        AnimatedBuilder(
          animation: _subtitleOpacity,
          builder: (context, child) {
            return Opacity(
              opacity: _subtitleOpacity.value,
              child: Text(
                _subtitles[currentIndex],
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }


  Widget _titleAndSeparator(int i, int currentIndex){
    return Row(
      children: [
        Text(
          _texts[i],
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(i == currentIndex ? 1 : 0.7),
          ),
        ),
        i==_texts.length-1?const SizedBox.shrink():
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 10,
          width: 10,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepOrange
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }
}

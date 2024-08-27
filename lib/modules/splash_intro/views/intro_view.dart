import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/modules/authentication/views/phone_authentication_view.dart';
import 'package:food_delivery/modules/splash_intro/blocs/intro_bloc.dart';
import 'package:food_delivery/utils/widgets/text_animation_widget.dart';
import 'package:video_player/video_player.dart';

class IntroScreen extends StatelessWidget {

  final bloc = IntroBloc();

  @override
  Widget build(BuildContext context) {
    bloc.add(IntroInitialSetupEvent());
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        child: BlocBuilder<IntroBloc, IntroState>(
          bloc: bloc,
  builder: (context, state) {
    return Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // Background video
            Positioned.fill(
              child:
    (state is IntroInitialSetupState)?
              VideoPlayer((state as IntroInitialSetupState).controller)
              :const SizedBox.shrink(),
            ),
            // Overlay text
            _overlayComponents(),
          ],
        );
  },
),
        width: double.maxFinite,
      ),
    );
  }

  Widget _overlayComponents(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Swiggy',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          TextHighlightAnimation(),
          ElevatedButton(onPressed: (){
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PhoneAuthenticationView()));
          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                       fixedSize: Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ),

              child: Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
          )
        ],
      ),
    );
  }


}





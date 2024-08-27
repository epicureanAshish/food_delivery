import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<IntroInitialSetupEvent>(introInitialSetupEvent);
  }



  FutureOr<void> introInitialSetupEvent(IntroInitialSetupEvent event, Emitter<IntroState> emit) {

    event.controller = VideoPlayerController.networkUrl(Uri.parse(
        "https://videos.pexels.com/video-files/3195650/3195650-uhd_2560_1440_25fps.mp4"))
      ..initialize().then((_) {
        event.controller.setLooping(true);
        event.controller.play();
      });
    emit.call(IntroInitialSetupState(controller: event.controller));
  }
}

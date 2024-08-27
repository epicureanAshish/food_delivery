part of 'intro_bloc.dart';

@immutable
sealed class IntroEvent {}

class IntroInitialSetupEvent extends IntroEvent{
  late VideoPlayerController controller;

  IntroInitialSetupEvent();
}
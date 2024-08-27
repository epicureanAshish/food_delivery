part of 'intro_bloc.dart';

@immutable
sealed class IntroState {}

final class IntroInitial extends IntroState {}

class IntroInitialSetupState extends IntroState{
  final VideoPlayerController controller;
  IntroInitialSetupState({required this.controller});

}
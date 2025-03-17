part of 'media_bloc.dart';

abstract class MediaEvent {}

class InitializeVideo extends MediaEvent {
  final String url;
  InitializeVideo(this.url);
}

class PlayVideo extends MediaEvent {}

class PauseVideo extends MediaEvent {}
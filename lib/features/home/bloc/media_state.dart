part of 'media_bloc.dart';

abstract class MediaState {}

class VideoInitial extends MediaState {}

class VideoPlaying extends MediaState {}

class VideoPaused extends MediaState {}
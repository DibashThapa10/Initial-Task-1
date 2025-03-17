import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  VideoPlayerController? controller;

  MediaBloc(String url) : super(VideoInitial()) {
    on<InitializeVideo>((event, emit) async {
      controller = VideoPlayerController.networkUrl(Uri.parse(event.url) )
        ..initialize().then((_) {
          add(PlayVideo());
          controller?.setLooping(true);
        });
    });

    on<PlayVideo>((event, emit) {
      controller?.play();
      emit(VideoPlaying());
    });

    on<PauseVideo>((event, emit) {
      controller?.pause();
      emit(VideoPaused());
    });
  }

  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
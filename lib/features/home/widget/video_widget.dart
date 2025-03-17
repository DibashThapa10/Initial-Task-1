import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task_1/features/home/bloc/media_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaBloc, MediaState>(
      builder: (context, state) {
        final bloc = context.read<MediaBloc>();
        return bloc.controller?.value.isInitialized == true
            ? AspectRatio(
                aspectRatio: bloc.controller!.value.aspectRatio,
                child: VideoPlayer(bloc.controller!),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
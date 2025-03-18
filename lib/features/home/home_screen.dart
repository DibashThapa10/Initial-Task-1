
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:initial_task_1/features/home/bloc/media_bloc.dart';
import 'package:initial_task_1/features/home/model/json_model.dart';
import 'package:initial_task_1/features/home/widget/url_webview.dart';
import 'package:initial_task_1/features/home/widget/video_widget.dart';

class HomeScreen extends StatelessWidget {
  final JsonData data;
  const HomeScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    
    if (data.data == null) {
     
      try {
        return _buildLayout(context);
      } catch (e) {
       
        return const SizedBox();
      }
    } else {
      return _buildMedia(context);
    }
  }

  Widget _buildLayout(BuildContext context) {
    final children =
        data.children
            ?.map(
              (child) =>
                  Expanded(flex: child.flex, child: HomeScreen(data: child)),
            )
            .toList();

    return data.type == 'Row'
        ? Row(children: children!)
        : Column(children: children!);
  }

  Widget _buildMedia(BuildContext context) {
    
    final mediaData = MediaData.fromJson(data.data);

    switch (mediaData.type) {
      case 'Image':
        return Image.network(mediaData.value, fit: BoxFit.cover);
      case 'Video':
        return BlocProvider(
          create:
              (_) =>
                  MediaBloc(mediaData.value)
                    ..add(InitializeVideo(mediaData.value)),
          child: const VideoWidget(),
        );
      case 'Url':
        return UrlWebView(url: mediaData.value);
      default:
        return const SizedBox();
    }
  }
}

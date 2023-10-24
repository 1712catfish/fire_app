import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:flutter_youtube_ui/screens/home_screen.dart';
import 'package:flutter_youtube_ui/screens/report_screen.dart';
import 'package:flutter_youtube_ui/screens/video_screen.dart';
import 'package:miniplayer/miniplayer.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const double _playerMinHeight = 60.0;

  int _selectedIndex = 0;

  final _screens = [
    HomeScreen(),
    const ReportScreen(),
    const Scaffold(body: Center(child: Text('Settings'))),
    const Scaffold(body: Center(child: Text('Settings'))),

    // const Scaffold(body: Center(child: Text('Subscriptions'))),
    // const Scaffold(body: Center(child: Text('Library'))),
  ];

  // List<CameraDescription>? cameras;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          final selectedVideo = watch(selectedVideoProvider).state;
          final miniPlayerController =
              watch(miniPlayerControllerProvider).state;
          return Stack(
            children: _screens
                .asMap()
                .map((i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: _selectedIndex != i,
                        child: screen,
                      ),
                    ))
                .values
                .toList()
                  ..add(
                    Offstage(
                      offstage: selectedVideo == null,
                      child: Miniplayer(
                        controller: miniPlayerController,
                        minHeight: _playerMinHeight,
                        maxHeight: MediaQuery.of(context).size.height,
                        builder: (height, percentage) {
                          if (selectedVideo == null)
                            return const SizedBox.shrink();

                          if (height <= _playerMinHeight + 50.0)
                            return Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        selectedVideo.thumbnailUrl,
                                        height: _playerMinHeight - 4.0,
                                        width: 120.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  selectedVideo.title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        color: checkFire(selectedVideo) ? Colors.red : Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              Flexible(
                                                // child: Text(
                                                //   selectedVideo.author.username,
                                                //   overflow:
                                                //       TextOverflow.ellipsis,
                                                //   style: Theme.of(context)
                                                //       .textTheme
                                                //       .caption!
                                                //       .copyWith(
                                                //           fontWeight:
                                                //               FontWeight.w500),
                                                // ),
                                                // child: Text(
                                                //   '${selectedVideo.sensor} • ${selectedVideo.temp} • ${selectedVideo.visionAI}',
                                                //   maxLines: 2,
                                                //   overflow: TextOverflow.ellipsis,
                                                //   style: Theme.of(context)
                                                //       .textTheme
                                                //       .caption!
                                                //       .copyWith(fontSize: 14.0),
                                                // ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      '${selectedVideo.sensor}',
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(fontSize: 14.0,
                                                          color: checkSensor(selectedVideo.sensor) ? Colors.red : Colors.white),
                                                    ),
                                                    Text(
                                                      ' • ',
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(fontSize: 14.0),
                                                    ),
                                                    Text(
                                                      '${selectedVideo.temp}',
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(fontSize: 14.0,
                                                          color: checkTemp(selectedVideo.temp) ? Colors.red : Colors.white),
                                                    ),
                                                    Text(
                                                      ' • ',
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(fontSize: 14.0),
                                                    ),
                                                    Text(
                                                      '${selectedVideo.visionAI}',
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(fontSize: 14.0,
                                                          color: checkAI(selectedVideo.visionAI) ? Colors.red : Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.play_arrow),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () {
                                          context
                                              .read(selectedVideoProvider)
                                              .state = null;
                                        },
                                      ),
                                    ],
                                  ),
                                  const LinearProgressIndicator(
                                    value: 0.4,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          return VideoScreen();
                        },
                      ),
                    ),
                  ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.explore_outlined),
          //   activeIcon: Icon(Icons.explore),
          //   label: 'Explore',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            activeIcon: Icon(Icons.camera_alt),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.subscriptions_outlined),
          //   activeIcon: Icon(Icons.subscriptions),
          //   label: 'Subscriptions',
          // ),

        ],
      ),
    );
  }
}

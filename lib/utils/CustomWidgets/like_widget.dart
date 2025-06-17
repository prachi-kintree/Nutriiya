import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_string/app_image_path.dart';
import 'increase_tap_area.dart';


enum LikeDislikeState {
  like,
  dislike,
}

class LikeDislikeWidget extends StatefulWidget {
  final LikeDislikeState initialState;
  final double likeSize;
  Function? likeDislikeCallback;

  LikeDislikeWidget(
      {required this.initialState,
      this.likeSize = 50.0,
      this.likeDislikeCallback});

  @override
  _LikeDislikeWidgetState createState() => _LikeDislikeWidgetState();
}

class _LikeDislikeWidgetState extends State<LikeDislikeWidget>
    with TickerProviderStateMixin {
  late AnimationController _likeController;
  late AnimationController _dislikeController;
  late Animation<double> _likeAnimation;
  late Animation<double> _dislikeAnimation;
  late LikeDislikeState _currentState;
  late double _likeSize;

  @override
  void initState() {
    super.initState();

    _currentState = widget.initialState;
    _likeSize = widget.likeSize;

    _likeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _likeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _likeController,
        curve: Curves.easeInOut,
      ),
    );

    _dislikeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _dislikeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _dislikeController,
        curve: Curves.easeInOut,
      ),
    );

    _likeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _likeController.reset();
        setState(() {
          _likeSize = widget
              .likeSize; // Reset size to default after animation completes
        });
      }
    });

    _dislikeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _dislikeController.reset();
        // You can also set the size for dislike if needed
      }
    });

    // if (widget.initialState == LikeDislikeState.like) {
    //   _likeController.forward();
    // } else {
    //   _dislikeController.forward();
    // }
  }

  @override
  void dispose() {
    _likeController.dispose();
    _dislikeController.dispose();
    super.dispose();
  }

  void _handleLikeDislikeTap() async {
// NetworkResponse? response = await ApiService()
//         .apiCall(url: apiLikeDislikeComment, requestType: RequestType.FORMDATA, body: {
//       "userId": getIt<LocalDataManager>().userId,
//     });
//     if (response != null) {

//     }

    if (widget.likeDislikeCallback != null) {
      widget.likeDislikeCallback!();
    }

    setState(() {
      if (_currentState == LikeDislikeState.like) {
        _currentState = LikeDislikeState.dislike;
        _dislikeController.reset();
        _dislikeController.reverse();
      } else {
        _currentState = LikeDislikeState.like;
        _likeController.reset();
        _likeController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: ValueKey(DateTime.now()),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IncreaseTapArea(
          onTap: _handleLikeDislikeTap,
          child: AnimatedBuilder(
            animation: _currentState == LikeDislikeState.like
                ? _likeAnimation
                : _dislikeAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: 1 +
                    (_currentState == LikeDislikeState.like
                        ? _likeAnimation.value
                        : _dislikeAnimation.value),
                child: SvgPicture.asset(
                  _currentState == LikeDislikeState.like
                      ? svgHeartFilled
                      : svgHeart,
                  color: _currentState != LikeDislikeState.like
                      ? Colors.black
                      : null,
                  // Replace with your actual SVG file paths
                  height: _likeSize,
                  width: _likeSize,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import './comment_child_widget.dart';
import './root_comment_widget.dart';
import './tree_theme_data.dart';
import 'package:provider/provider.dart';

typedef AvatarWidgetBuilder<T> = PreferredSize Function(
  BuildContext context,
  T value,
);
typedef ContentBuilder<T> = Widget Function(BuildContext context, T value);

class CommentTreeWidget<R, C> extends StatefulWidget {
  // ignore: constant_identifier_names
  static const ROUTE_NAME = 'CommentTreeWidget';

  final R root;
  final List<C> replies;

  final AvatarWidgetBuilder<R>? avatarRoot;
  final ContentBuilder<R>? contentRoot;

  final AvatarWidgetBuilder<C>? avatarChild;
  final ContentBuilder<C>? contentChild;
  final TreeThemeData treeThemeData;
  final bool isExpanded;

  const CommentTreeWidget(this.root, this.replies,
      {this.treeThemeData = const TreeThemeData(lineWidth: 1),
      this.avatarRoot,
      this.contentRoot,
      this.avatarChild,
      this.contentChild,
      this.isExpanded = false});

  @override
  _CommentTreeWidgetState<R, C> createState() =>
      _CommentTreeWidgetState<R, C>();
}

class _CommentTreeWidgetState<R, C> extends State<CommentTreeWidget<R, C>> {
  @override
  Widget build(BuildContext context) {
    int itemcount = widget.replies.length;
    if (!widget.isExpanded && itemcount >= 3) {
      itemcount = 2;
    }
    final PreferredSize avatarRoot = widget.avatarRoot!(context, widget.root);
    return Provider<TreeThemeData>.value(
      key: UniqueKey(),
      value: widget.treeThemeData,
      child: Column(
        children: [
          RootCommentWidget(
            avatarRoot,
            widget.contentRoot!(context, widget.root),
          ),
          
          ...widget.replies.map(
            (e) => CommentChildWidget(
              context: context,
              isLast: widget.replies.indexOf(e) == (widget.replies.length - 1),
              avatar: widget.avatarChild!(context, e),
              avatarRoot: avatarRoot.preferredSize,
              content: widget.contentChild!(context, e),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:flutter/widgets.dart';

class UnfoldableListController extends ChangeNotifier {
  UnfoldableListController({
    int? unfoldedItemLimit,
  }) : unfoldedItemLimit = unfoldedItemLimit ?? -1;

  /// -1 for no limit
  final int unfoldedItemLimit;

  Set<Key> unfoldedItems = {};

  bool isUnfolded(Key key) => unfoldedItems.contains(key);

  void toggle(Key key) {
    if (unfoldedItems.contains(key)) {
      fold(key);
    } else {
      unfold(key);
    }
  }

  void fold(Key key) {
    unfoldedItems.remove(key);
    notifyListeners();
  }

  void unfold(Key key) {
    unfoldedItems.add(key);
    if (unfoldedItemLimit > 0 && unfoldedItems.length > unfoldedItemLimit) {
      unfoldedItems =
          unfoldedItems.skip(unfoldedItems.length - unfoldedItemLimit).toSet();
    }
    notifyListeners();
  }
}

class UnfoldableList extends StatefulWidget {
  const UnfoldableList({
    super.key,
    required this.child,
    this.unfoldedItemLimit,
    this.controller,
  }) : assert(unfoldedItemLimit == null || controller == null,
            'You cant set both unfoldedItemLimit and controller properties at the same time.');

  final Widget child;
  final int? unfoldedItemLimit;
  final UnfoldableListController? controller;

  @override
  UnfoldableListState createState() => UnfoldableListState();
}

class UnfoldableListState extends State<UnfoldableList> {
  UnfoldableListState();

  late final _controller = widget.controller ??
      UnfoldableListController(unfoldedItemLimit: widget.unfoldedItemLimit);

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: {
        ToggleUnfoldableItem: CallbackAction<ToggleUnfoldableItem>(
          onInvoke: (intent) => _controller.toggle(intent.key),
        ),
        FoldUnfoldableItem: CallbackAction<FoldUnfoldableItem>(
          onInvoke: (intent) => _controller.fold(intent.key),
        ),
        UnfoldUnfoldableItem: CallbackAction<UnfoldUnfoldableItem>(
          onInvoke: (intent) => _controller.unfold(intent.key),
        ),
      },
      child: UnfoldableListControllerProvider(
        notifier: _controller,
        child: widget.child,
      ),
    );
  }
}

class UnfoldableListControllerProvider
    extends InheritedNotifier<UnfoldableListController> {
  const UnfoldableListControllerProvider({
    super.key,
    required super.notifier,
    required super.child,
  });

  static UnfoldableListController of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<UnfoldableListControllerProvider>()!
      .notifier!;
}

class FoldUnfoldableItem extends Intent {
  const FoldUnfoldableItem(this.key);

  final Key key;
}

class UnfoldUnfoldableItem extends Intent {
  const UnfoldUnfoldableItem(this.key);

  final Key key;
}

class ToggleUnfoldableItem extends Intent {
  const ToggleUnfoldableItem(this.key);

  final Key key;
}

typedef UnfoldUnfoldableItemFrameBuilder = Widget Function(
  BuildContext context,
  UnfoldableListController controller,
  Widget child,
);

/// You can trigger fold/unfold event using [FoldUnfoldableItem], [UnfoldUnfoldableItem] and [ToggleUnfoldableItem] intents
class UnfoldableListItem extends StatelessWidget {
  UnfoldableListItem({
    Key? key,
    required this.fold,
    required this.unfold,
  }) : super(
          key: key ?? UniqueKey(),
        );

  final Widget fold;
  final Widget unfold;
  final UnfoldUnfoldableItemFrameBuilder? frameBuilder;

  @override
  Widget build(BuildContext context) {
    final controller = UnfoldableListControllerProvider.of(context);
    final child= AnimatedBuilder(
        animation: controller,
        builder: (context, _) => Unfoldable(
          unfolded: controller.isUnfolded(key!),
          fold: fold,
          unfold: unfold,
        ),
      );
    return frameBuilder?.call(context, controller, child) :
      child;
    
  }
}

class UnfoldableListCard extends StatelessWidget {
  const UnfoldableListCard({
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return TbtHoverCard(
      onTap: () {
        Actions.invoke(context, ToggleUnfoldableItem(key!));
      },
      onFocusChanged: (focused) {
        if (focused) {
          Actions.invoke(context, FoldUnfoldableItem(key!));
        }
      },);
  }
}
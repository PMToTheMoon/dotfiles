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

class DefaultUnfoldableListController
    extends InheritedNotifier<UnfoldableListController> {
  DefaultUnfoldableListController({
    super.key,
    required super.child,
    int? unfoldedItemLimit,
  }) : super(
          notifier:
              UnfoldableListController(unfoldedItemLimit: unfoldedItemLimit),
        );

  static UnfoldableListController of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<DefaultUnfoldableListController>()!
      .notifier!;
}

class FoldUnfoldableItem extends Intent {
  const FoldUnfoldableItem();
}

class UnfoldUnfoldableItem extends Intent {
  const UnfoldUnfoldableItem();
}

class ToggleUnfoldableItem extends Intent {
  const ToggleUnfoldableItem();
}

/// You can trigger fold/unfold event using [FoldUnfoldableItem], [UnfoldUnfoldableItem] and [ToggleUnfoldableItem] intents
class UnfoldableListItem extends StatefulWidget {
  UnfoldableListItem({
    Key? key,
    required this.fold,
    required this.unfold,
    this.containerBuilder,
  }) : super(
          key: key ?? UniqueKey(),
        );

  final Widget fold;
  final Widget unfold;
  final Widget Function(BuildContext context, Widget child)? containerBuilder;

  @override
  State<UnfoldableListItem> createState() => _UnfoldableListItemState();
}

class _UnfoldableListItemState extends State<UnfoldableListItem> {
  final Key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final controller = DefaultUnfoldableListController.of(context);
    final child = AnimatedBuilder(
      animation: controller,
      builder: (context, _) => Unfoldable(
        unfolded: controller.isUnfolded(widget.key!),
        fold: widget.fold,
        unfold: widget.unfold,
      ),
    );
    return Actions(
      actions: {
        ToggleUnfoldableItem: CallbackAction<ToggleUnfoldableItem>(
          onInvoke: (intent) => controller.toggle(widget.key!),
        ),
        FoldUnfoldableItem: CallbackAction<FoldUnfoldableItem>(
          onInvoke: (intent) => controller.fold(widget.key!),
        ),
        UnfoldUnfoldableItem: CallbackAction<UnfoldUnfoldableItem>(
          onInvoke: (intent) => controller.unfold(widget.key!),
        ),
      },
      child: Builder(
        builder: (builderContext) =>
            widget.containerBuilder?.call(builderContext, child) ?? child,
      ),
    );
  }
}

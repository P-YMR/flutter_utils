import 'package:flutter/material.dart';

import '../../widgets/view_notifier.dart';
import '../image/view.dart';
import '../text/view.dart';
import '../view/view.dart';

typedef SIVIndexing<T> = bool Function(T item);
typedef SIVCounterBuilder<T> = Widget Function(
  BuildContext context,
  int index,
  T item,
);
typedef SIVChangedHandler<T> = Function(
  int index,
  T item,
);

class SlideImageView<T> extends YMRView<SlideImageViewController<T>> {
  final double? frameRatio;
  final Color? itemBackground;
  final BoxFit? itemScaleType;
  final ImageType? itemType;
  final List<T>? items;
  final dynamic placeholder;
  final ImageType? placeholderType;
  final SIVChangedHandler<T>? changedHandler;
  final SIVCounterBuilder<T>? counterBuilder;
  final ViewPositionType? counterPosition;
  final bool? counterVisibility;
  final int? selectionIndex;
  final SIVIndexing<T>? selectionIndexBuilder;

  const SlideImageView({
    /// ROOT PROPERTIES
    super.key,
    super.controller,

    /// CALLBACK PROPERTIES
    super.onActivator,
    super.onChange,
    super.onError,
    super.onHover,
    super.onValid,
    super.onValidator,

    /// CLICK PROPERTIES
    super.clickEffect,
    super.onClick,
    super.onDoubleClick,
    super.onLongClick,
    super.onToggleClick,
    super.onClickHandler,
    super.onDoubleClickHandler,
    super.onLongClickHandler,

    ///BASE PROPERTIES
    super.absorbMode,
    super.activated,
    super.background,
    super.backgroundState,
    super.backgroundBlendMode,
    super.backgroundGradient,
    super.backgroundGradientState,
    super.backgroundImage,
    super.backgroundImageState,
    super.clipBehavior,
    super.dimensionRatio,
    super.elevation,
    super.enabled,
    super.expandable,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.gravity,
    super.height,
    super.heightState,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.orientation,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.scrollable,
    super.scrollController,
    super.scrollingType,
    super.shape,
    super.transform,
    super.transformGravity,
    super.visibility,
    super.width,
    super.widthState,
    super.widthMax,
    super.widthMin,

    /// ANIMATION PROPERTIES
    super.animation,
    super.animationType,

    /// BACKDROP PROPERTIES
    super.backdropFilter,
    super.backdropMode,

    /// BORDER PROPERTIES
    super.borderColor,
    super.borderColorState,
    super.borderSize,
    super.borderSizeState,
    super.borderHorizontal,
    super.borderHorizontalState,
    super.borderVertical,
    super.borderVerticalState,
    super.borderTop,
    super.borderTopState,
    super.borderBottom,
    super.borderBottomState,
    super.borderStart,
    super.borderStartState,
    super.borderEnd,
    super.borderEndState,
    super.borderStrokeAlign,

    /// BORDER RADIUS PROPERTIES
    super.borderRadius,
    super.borderRadiusState,
    super.borderRadiusBL,
    super.borderRadiusBLState,
    super.borderRadiusBR,
    super.borderRadiusBRState,
    super.borderRadiusTL,
    super.borderRadiusTLState,
    super.borderRadiusTR,
    super.borderRadiusTRState,

    /// MARGIN PROPERTIES
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,

    /// PADDING PROPERTIES
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,

    /// SHADOW PROPERTIES
    super.shadow,
    super.shadowBlurRadius,
    super.shadowBlurStyle,
    super.shadowColor,
    super.shadowType,
    super.shadowSpreadRadius,
    super.shadowHorizontal,
    super.shadowVertical,
    super.shadowStart,
    super.shadowEnd,
    super.shadowTop,
    super.shadowBottom,

    /// CHILD PROPERTIES
    this.frameRatio,
    this.itemBackground,
    this.itemScaleType,
    this.itemType,
    this.items,
    this.placeholder,
    this.placeholderType,
    this.changedHandler,
    this.counterBuilder,
    this.counterPosition,
    this.counterVisibility,
    this.selectionIndex,
    this.selectionIndexBuilder,
  });

  @override
  SlideImageViewController<T> initController() {
    return SlideImageViewController<T>();
  }

  @override
  SlideImageViewController<T> attachController(
    SlideImageViewController<T> controller,
  ) {
    return controller.fromView(
      this,
      counterBuilder: counterBuilder,
      counterPosition: counterPosition,
      counterVisibility: counterVisibility,
      frameRatio: frameRatio,
      itemBackground: itemBackground,
      itemScaleType: itemScaleType,
      itemType: itemType,
      items: items,
      placeholder: placeholder,
      placeholderType: placeholderType,
      selectionIndex: selectionIndex,
      selectionIndexBuilder: selectionIndexBuilder,
    );
  }

  @override
  Widget? attach(BuildContext context, SlideImageViewController<T> controller) {
    return _SIVChild(controller: controller);
  }
}

class SlideImageViewController<T> extends ViewController {
  late PageController pager;
  late TextViewController counter;
  late NotifierViewController notifyCounter;

  double? frameRatio;
  Color? itemBackground;
  BoxFit itemScaleType = BoxFit.cover;
  ImageType itemType = ImageType.detect;
  List<T> items = [];
  dynamic placeholder;
  ImageType placeholderType = ImageType.detect;
  SIVChangedHandler<T>? changedHandler;
  SIVCounterBuilder<T>? counterBuilder;
  ViewPositionType counterPosition = ViewPositionType.topRight;
  bool counterVisibility = true;
  int selectionIndex = 0;
  SIVIndexing<T>? selectionIndexBuilder;

  int index = 0;

  @override
  SlideImageViewController<T> fromView(
    YMRView<ViewController> view, {
    SIVChangedHandler<T>? changedHandler,
    SIVCounterBuilder<T>? counterBuilder,
    ViewPositionType? counterPosition,
    bool? counterVisibility,
    double? frameRatio,
    Color? itemBackground,
    BoxFit? itemScaleType,
    ImageType? itemType,
    List<T>? items,
    dynamic placeholder,
    ImageType? placeholderType,
    int? selectionIndex,
    SIVIndexing<T>? selectionIndexBuilder,
  }) {
    this.changedHandler = changedHandler;
    this.counterBuilder = counterBuilder;
    this.counterPosition = counterPosition ?? ViewPositionType.topRight;
    this.counterVisibility = counterVisibility ?? true;
    this.frameRatio = frameRatio;
    this.itemBackground = itemBackground;
    this.itemScaleType = itemScaleType ?? BoxFit.cover;
    this.itemType = itemType ?? ImageType.detect;
    this.items = items ?? [];
    this.placeholder = placeholder;
    this.placeholderType = placeholderType ?? ImageType.detect;
    this.selectionIndex = selectionIndex ?? 0;
    this.selectionIndexBuilder = selectionIndexBuilder;
    this.index = _selectionIndex;
    this.pager = PageController(initialPage: index);
    this.counter = TextViewController();
    this.notifyCounter = NotifierViewController();
    super.fromView(view);
    return this;
  }

  T get item => items[index];

  int get _selectionIndex {
    var value = selectionIndex;
    if (selectionIndexBuilder != null) {
      value = items.indexWhere((item) {
        return selectionIndexBuilder?.call(item) ?? false;
      });
    }
    return value > -1 && value < size ? value : 0;
  }

  int get size => items.length;

  void _setCounterNotifier(int value) {
    index = value;
    notifyCounter.onNotify();
  }

  String countingTextBuilder(
    int current,
    int total, [
    String separator = "/",
  ]) {
    return "$current$separator$total";
  }

  void _dispose() {
    pager.dispose();
  }
}

class _SIVChild<T> extends StatefulWidget {
  final SlideImageViewController<T> controller;

  const _SIVChild({
    super.key,
    required this.controller,
  });

  @override
  State<_SIVChild<T>> createState() => _SIVChildState<T>();
}

class _SIVChildState<T> extends State<_SIVChild<T>> {
  late PageController pager;
  late TextViewController counter;
  late SlideImageViewController<T> controller;

  @override
  void initState() {
    controller = widget.controller;
    pager = controller.pager;
    counter = controller.counter;
    super.initState();
  }

  @override
  void dispose() {
    controller._dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = controller.index;
    final items = controller.items;
    final size = controller.size;
    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Stack(
            children: [
              PageView.builder(
                controller: pager,
                itemCount: size,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ImageView(
                    width: double.infinity,
                    height: double.infinity,
                    scaleType: controller.itemScaleType,
                    placeholder: controller.placeholder,
                    placeholderType: controller.placeholderType,
                    image: item,
                    imageType: controller.itemType,
                  );
                },
                onPageChanged: (index) {
                  if (controller.changedHandler != null) {
                    controller.changedHandler?.call(index, items[index]);
                  }
                  if (controller.counterBuilder != null) {
                    controller._setCounterNotifier(index);
                  } else {
                    counter.setText(controller.countingTextBuilder(
                      index + 1,
                      size,
                    ));
                  }
                },
              ),
              YMRView(
                visibility: controller.counterVisibility,
                positionType: controller.counterPosition,
                child: controller.counterBuilder != null
                    ? ViewNotifier(
                        controller: controller.notifyCounter,
                        onNotify: (context) {
                          return controller.counterBuilder?.call(
                            context,
                            controller.index,
                            controller.item,
                          );
                        },
                      )
                    : TextView(
                        gravity: Alignment.center,
                        controller: counter,
                        background: Colors.black.withOpacity(0.75),
                        borderRadius: 25,
                        margin: 12,
                        paddingVertical: 8,
                        paddingHorizontal: 12,
                        text: controller.countingTextBuilder(index + 1, size),
                        textColor: Colors.white,
                        textSize: 12,
                        maxLines: 1,
                        visibility: size > 1,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

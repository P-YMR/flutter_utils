import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../icon/view.dart';
import '../text/view.dart';
import '../view/view.dart';

part 'controller.dart';

part 'drawable_state.dart';

part 'footer.dart';

part 'header.dart';

part 'highlight_text.dart';

part 'typedefs.dart';

part 'underline.dart';

class EditText<T extends EditTextController> extends TextView<T> {
  /// HELPER TEXT PROPERTIES
  final String helperText;
  final Color? helperTextColor;

  /// FLOATING TEXT PROPERTIES
  final Color? floatingTextColor;
  final double floatingTextSize;
  final EdgeInsets floatingTextSpace;
  final bool floatingTextVisible;

  /// ERROR TEXT PROPERTIES
  final bool errorTextVisible;
  final Color? errorTextColor;

  /// COUNTER TEXT PROPERTIES
  final bool counterTextVisible;

  /// BASE PROPERTIES
  final bool autoDisposeMode;
  final String characters;
  final String hint;
  final Color? hintColor;
  final String ignorableCharacters;
  final Color? primary;
  final bool maxCharactersAsLimit;
  final int? minCharacters;
  final List<TextInputFormatter>? inputFormatters;

  /// DRAWABLE PROPERTIES
  final dynamic drawableStart;
  final ValueState<dynamic>? drawableStartState;
  final EditTextDrawableBuilder<T>? drawableStartBuilder;
  final double drawableStartSize;
  final ValueState<double>? drawableStartSizeState;
  final double? drawableStartPadding;
  final ValueState<double>? drawableStartPaddingState;
  final Color? drawableStartTint;
  final ValueState<Color>? drawableStartTintState;
  final bool drawableStartVisible;
  final dynamic drawableEnd;
  final ValueState<dynamic>? drawableEndState;
  final EditTextDrawableBuilder<T>? drawableEndBuilder;
  final double drawableEndSize;
  final ValueState<double>? drawableEndSizeState;
  final double? drawableEndPadding;
  final ValueState<double>? drawableEndPaddingState;
  final Color? drawableEndTint;
  final ValueState<Color>? drawableEndTintState;
  final bool drawableEndVisible;
  final bool drawableEndAsEye;

  /// INDICATOR PROPERTIES
  final Widget? indicator;
  final double indicatorSize;
  final Color? indicatorStrokeColor;
  final ValueState<Color>? indicatorStrokeColorState;
  final double indicatorStroke;
  final Color? indicatorStrokeBackground;
  final ValueState<Color>? indicatorStrokeBackgroundState;

  /// EDITING PROPERTIES
  final bool autocorrect;
  final List<String> autofillHints;
  final bool autoFocus;
  final Clip clipBehaviorText;
  final Color? cursorColor;
  final double? cursorHeight;
  final bool cursorOpacityAnimates;
  final Radius? cursorRadius;
  final double cursorWidth;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final EditTextContextMenuBuilder? contextMenuBuilder;
  final DragStartBehavior dragStartBehavior;
  final bool enableIMEPersonalizedLearning;
  final bool? enableInteractiveSelection;
  final bool enableSuggestions;
  final bool expands;
  final TextInputType? inputType;
  final Brightness keyboardAppearance;
  final TextMagnifierConfiguration magnifierConfiguration;
  final int? minLines;
  final MouseCursor? mouseCursor;
  final bool? obscureText;
  final String obscuringCharacter;
  final bool readOnly;
  final String? restorationId;
  final bool scribbleEnabled;
  final ScrollController? scrollControllerText;
  final EdgeInsets scrollPaddingText;
  final ScrollPhysics? scrollPhysicsText;
  final Color? secondaryColor;
  final TextSelectionControls? selectionControls;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final bool? showCursor;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final Color? underlineColor;
  final UndoHistoryController? undoController;

  /// LISTENER & CALLBACKS
  final EditTextPrivateCommandListener? onAppPrivateCommand;
  final EditTextVoidListener? onEditingComplete;
  final EditTextSubmitListener? onSubmitted;
  final EditTextTapOutsideListener? onTapOutside;

  const EditText({
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

    /// INDICATOR PROPERTIES
    super.indicatorVisible,

    /// MARGIN PROPERTIES
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.marginCustom,

    /// OPACITY PROPERTIES
    super.opacity,
    super.opacityState,
    super.opacityAlwaysIncludeSemantics,

    /// PADDING PROPERTIES
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.paddingCustom,

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

    /// SUPER TEXT PROPERTIES
    super.maxCharacters,
    super.maxLines,
    super.letterSpacing,
    super.lineSpacingExtra,
    super.locale,
    super.wordSpacing,
    super.textFontFamily,
    super.textFontStyle,
    super.textFontWeight,
    super.selectionColor,
    super.strutStyle,
    super.text,
    super.textAlign,
    super.textAllCaps,
    super.textColor,
    super.textHeightBehavior,
    super.textOverflow,
    super.textSize,
    super.textStyle,
    super.textWidthBasis,

    /// HELPER TEXT PROPERTIES
    this.helperText = "",
    this.helperTextColor,
    this.floatingTextColor,
    this.floatingTextSize = 12,
    this.floatingTextSpace = EdgeInsets.zero,
    this.floatingTextVisible = false,

    /// ERROR TEXT PROPERTIES
    this.errorTextColor = const Color(0xFFFF7769),
    this.errorTextVisible = true,
    this.counterTextVisible = false,

    /// BASE PROPERTIES
    this.autoDisposeMode = true,
    this.characters = "",
    this.hint = "",
    this.hintColor,
    this.primary,
    this.minCharacters,

    /// DRAWABLE PROPERTIES
    this.drawableStart,
    this.drawableStartState,
    this.drawableStartBuilder,
    this.drawableStartSize = 24,
    this.drawableStartSizeState,
    this.drawableStartPadding,
    this.drawableStartPaddingState,
    this.drawableStartTint,
    this.drawableStartTintState,
    this.drawableStartVisible = true,
    this.drawableEnd,
    this.drawableEndState,
    this.drawableEndBuilder,
    this.drawableEndSize = 24,
    this.drawableEndSizeState,
    this.drawableEndPadding,
    this.drawableEndPaddingState,
    this.drawableEndTint,
    this.drawableEndTintState,
    this.drawableEndVisible = true,
    this.drawableEndAsEye = false,

    /// INDICATOR PROPERTIES
    this.indicator,
    this.indicatorSize = 24,
    this.indicatorStrokeColor,
    this.indicatorStrokeColorState,
    this.indicatorStroke = 2,
    this.indicatorStrokeBackground,
    this.indicatorStrokeBackgroundState,

    /// EDITING PROPERTIES
    this.autocorrect = true,
    this.autofillHints = const [],
    this.autoFocus = false,
    this.clipBehaviorText = Clip.hardEdge,
    this.cursorColor,
    this.cursorHeight,
    this.cursorOpacityAnimates = false,
    this.cursorRadius,
    this.cursorWidth = 2,
    this.contentInsertionConfiguration,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableIMEPersonalizedLearning = true,
    this.enableInteractiveSelection,
    this.enableSuggestions = true,
    this.expands = false,
    this.ignorableCharacters = "",
    this.inputFormatters,
    this.inputType,
    this.keyboardAppearance = Brightness.light,
    this.magnifierConfiguration = TextMagnifierConfiguration.disabled,
    this.maxCharactersAsLimit = true,
    this.minLines,
    this.mouseCursor,
    this.obscureText,
    this.obscuringCharacter = '•',
    this.readOnly = false,
    this.restorationId,
    this.scribbleEnabled = true,
    this.scrollControllerText,
    this.scrollPaddingText = const EdgeInsets.all(20),
    this.scrollPhysicsText,
    this.secondaryColor,
    this.selectionControls,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.showCursor,
    this.smartDashesType,
    this.smartQuotesType,
    this.spellCheckConfiguration,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.underlineColor,
    this.undoController,

    /// CALLBACK AND LISTENING PROPERTIES
    this.onAppPrivateCommand,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTapOutside,
  });

  @override
  ViewRoots initRootProperties() {
    return const ViewRoots(
      clickable: false,
      padding: false,
      margin: false,
    );
  }

  @override
  T initController() => EditTextController() as T;

  @override
  T attachController(T controller) => controller.fromEditText(this) as T;

  @override
  void onDispose(context, controller) {
    super.onDispose(context, controller);
    return controller._dispose();
  }

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @visibleForTesting
  static Widget defaultSpellCheckSuggestionsToolbarBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoSpellCheckSuggestionsToolbar.editableText(
          editableTextState: editableTextState,
        );
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return SpellCheckSuggestionsToolbar.editableText(
          editableTextState: editableTextState,
        );
    }
  }

  static SpellCheckConfiguration inferAndroidSpellCheckConfiguration(
    SpellCheckConfiguration? configuration,
  ) {
    if (configuration == null ||
        configuration == const SpellCheckConfiguration.disabled()) {
      return const SpellCheckConfiguration.disabled();
    }
    return configuration.copyWith(
      misspelledTextStyle: configuration.misspelledTextStyle ??
          TextField.materialMisspelledTextStyle,
      spellCheckSuggestionsToolbarBuilder:
          configuration.spellCheckSuggestionsToolbarBuilder ??
              defaultSpellCheckSuggestionsToolbarBuilder,
    );
  }

  @override
  Widget? attach(BuildContext context, T controller) {
    final theme = Theme.of(context);
    final themeStyle = theme.textTheme.bodyLarge ?? const TextStyle();
    final primaryColor = controller.primary ?? theme.primaryColor;
    final secondaryColor = controller.secondaryColor ?? const Color(0xffbbbbbb);
    final underlineColor = controller.underlineColor ?? const Color(0xffe1e1e1);
    final errorColor = controller.errorTextColor ?? const Color(0xFFFF7769);
    final hasError = controller.hasError;

    var style = (controller.textStyle ?? themeStyle).copyWith(
      fontSize: controller.textSize ?? 18,
      height: 1.2,
    );
    var hintStyle = (controller.hintStyle ?? themeStyle).copyWith(
      fontSize: controller.textSize ?? 18,
      height: 1.2,
      color: controller.text.isNotEmpty
          ? Colors.transparent
          : controller.hintTextColor ?? secondaryColor,
    );
    var colors = ValueState(
      primary: secondaryColor,
      secondary: primaryColor,
      disable: secondaryColor,
      ternary: secondaryColor,
      error: errorColor,
    );

    var defaultColor = colors.fromController(controller);

    Widget child = Container(
      color: Colors.transparent,
      padding: controller.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (drawableStartBuilder != null)
            drawableStartBuilder!(context, controller)
          else
            IconView(
              visibility: controller.drawableStart != null,
              icon: controller.drawableStart,
              size: controller.drawableStartSize,
              tint: controller.drawableStartTint ?? defaultColor,
              marginEnd: controller.drawableStartPadding ?? 12,
            ),
          Expanded(
            child: TextField(
              canRequestFocus: true,
              enabled: controller.enabled,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                isCollapsed: true,
                hintText: controller.hintText,
                hintStyle: hintStyle,
              ),
              autocorrect: controller.autocorrect,
              autofillHints: controller.autofillHints,
              autofocus: controller.autoFocus,
              clipBehavior: controller.clipBehaviorText,
              controller: controller._editor,
              cursorColor: controller.cursorColor ?? primaryColor,
              cursorHeight: controller.cursorHeight,
              cursorOpacityAnimates: controller.cursorOpacityAnimates,
              cursorRadius: controller.cursorRadius,
              cursorWidth: controller.cursorWidth,
              contentInsertionConfiguration:
                  controller.contentInsertionConfiguration,
              contextMenuBuilder: controller.contextMenuBuilder,
              dragStartBehavior: controller.dragStartBehavior,
              enableIMEPersonalizedLearning:
                  controller.enableIMEPersonalizedLearning,
              enableInteractiveSelection: controller.enableInteractiveSelection,
              enableSuggestions: controller.enableSuggestions,
              expands: controller.expands,
              focusNode: controller._node,
              inputFormatters: controller._formatter,
              keyboardAppearance: controller.keyboardAppearance,
              keyboardType: controller.inputType,
              maxLines: controller.maxLines,
              magnifierConfiguration: controller.magnifierConfiguration,
              maxLength: null,
              minLines: controller.minLines,
              mouseCursor: controller.mouseCursor,
              obscureText: controller.obscureText,
              obscuringCharacter: controller.obscuringCharacter,
              onAppPrivateCommand: controller.onAppPrivateCommand,
              onChanged: controller._handleEditingChange,
              onEditingComplete: controller.onEditingComplete,
              onSubmitted: controller.onSubmitted,
              onTapOutside: controller.onTapOutside,
              readOnly: controller.isReadMode,
              restorationId: controller.restorationId,
              scribbleEnabled: controller.scribbleEnabled,
              scrollController: controller.scrollControllerText,
              scrollPadding: controller.textScrollPadding,
              scrollPhysics: controller.textScrollPhysics,
              selectionControls: controller.selectionControls,
              selectionHeightStyle: controller.selectionHeightStyle,
              selectionWidthStyle: controller.selectionWidthStyle,
              showCursor: controller.showCursor,
              smartDashesType: controller.smartDashesType,
              smartQuotesType: controller.smartQuotesType,
              spellCheckConfiguration: controller.spellCheckConfiguration,
              strutStyle: controller.strutStyle,
              style: style,
              textAlign: controller.textAlign ?? TextAlign.start,
              textCapitalization: controller.textCapitalization,
              textDirection: controller.textDirection,
              textInputAction: controller.textInputAction,
              undoController: controller.undoController,
            ),
          ),
          if (controller.isIndicatorVisible)
            Container(
              width: controller.indicatorSize,
              height: controller.indicatorSize,
              padding: EdgeInsets.all(controller.indicatorSize * 0.05),
              margin: const EdgeInsets.only(left: 8),
              child: CircularProgressIndicator(
                strokeWidth: controller.indicatorStroke,
                color: controller.indicatorStrokeColor ?? defaultColor,
                backgroundColor: controller.indicatorStrokeBackground ??
                    defaultColor?.withOpacity(0.1),
              ),
            )
          else if (drawableEndBuilder != null)
            drawableEndBuilder!(context, controller)
          else
            IconView(
              visibility: controller.drawableEnd != null,
              icon: controller.drawableEnd,
              size: controller.drawableEndSize,
              tint: controller.drawableEndTint ?? defaultColor,
              marginStart: controller.drawableEndPadding ?? 4,
              onToggleClick:
                  controller.drawableEndAsEye ? controller.onChangeEye : null,
            ),
        ],
      ),
    );

    return GestureDetector(
      onTap: () => controller.showKeyboard(context),
      child: child,
    );

    return GestureDetector(
      onTap: () => controller.showKeyboard(context),
      child: controller.isUnderlineHide
          ? child
          : Column(
              children: [
                _Header(
                  controller: controller,
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                  visible: floatingTextVisible,
                  floatingTextSpace: floatingTextSpace,
                ),
                child,
                Underline(
                  visible: controller.background == null &&
                      controller.borderAll <= 0,
                  focused: controller.isFocused,
                  enabled: controller.enabled,
                  error: controller.error,
                  height: 1,
                  primary: primaryColor,
                  colorState: ValueState(
                    primary: primaryColor,
                    secondary: underlineColor,
                    error: errorColor,
                    disable: underlineColor,
                  ),
                ),
                _Footer(
                  hasError: hasError,
                  controller: controller,
                  secondaryColor: secondaryColor,
                  floatingTextSpace: floatingTextSpace,
                ),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context, T controller, Widget parent) {
    final theme = Theme.of(context);
    final primaryColor = controller.primary ?? theme.primaryColor;
    final secondaryColor = controller.secondaryColor ?? const Color(0xffbbbbbb);
    final underlineColor = controller.underlineColor ?? const Color(0xffe1e1e1);
    final errorColor = controller.errorTextColor ?? const Color(0xFFFF7769);
    final hasError = controller.hasError;

    return Container(
      margin: controller.margin,
      child: Column(
        children: [
          _Header(
            controller: controller,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
            visible: floatingTextVisible,
            floatingTextSpace: floatingTextSpace,
          ),
          parent,
          Underline(
            visible: controller.background == null && controller.borderAll <= 0,
            focused: controller.isFocused,
            enabled: controller.enabled,
            error: controller.error,
            height: 1,
            primary: primaryColor,
            colorState: ValueState(
              primary: primaryColor,
              secondary: underlineColor,
              error: errorColor,
              disable: underlineColor,
            ),
          ),
          _Footer(
            hasError: hasError,
            controller: controller,
            secondaryColor: secondaryColor,
            floatingTextSpace: floatingTextSpace,
          ),
        ],
      ),
    );
  }
}

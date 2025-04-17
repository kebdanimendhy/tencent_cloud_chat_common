import 'package:flutter/widgets.dart';
import 'package:tencent_cloud_chat_common/tencent_cloud_chat.dart';
import 'package:tencent_cloud_chat_common/widgets/avatar/tencent_cloud_chat_avatar.dart';
import 'package:tencent_cloud_chat_common/widgets/desktop_popup/operation_key.dart';
import 'package:tencent_cloud_chat_common/widgets/desktop_popup/tencent_cloud_chat_desktop_popup.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

typedef CommonAvatarBuilder = Widget? Function({
  required TencentCloudChatAvatarScene scene,
  double? width,
  double? height,
  double? borderRadius,
  required List<String?> imageList,
  Decoration? decoration,
});

typedef ShowDesktopPopupFunc = Future<bool> Function({
  required BuildContext context,
  required Widget Function(VoidCallback closeFunc) child,
  double? width,
  double? height,
  Offset? offset,
  String? initText,
  BorderRadius? borderRadius,
  bool? isDarkBackground,
  String? title,
  VoidCallback? onSubmit,
  Widget? submitWidget,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
});

typedef MessageSummaryGetter = String? Function({V2TimMessage? message, int? messageReceiveOption, int? unreadCount, String? draftText, required bool needStatus});

class TencentCloudChatCommonBuilders {
  static CommonAvatarBuilder? _commonAvatarBuilder;
  static ShowDesktopPopupFunc? _showDesktopPopupFunc;
  static CacheManager? _networkImageCacheManager;
  static MessageSummaryGetter? _messageSummaryGetter;

  TencentCloudChatCommonBuilders({
    CommonAvatarBuilder? commonAvatarBuilder,
    ShowDesktopPopupFunc? showDesktopPopupFunc,
    CacheManager? networkImageCacheManager,
    MessageSummaryGetter? messageSummaryGetter,
  }) {
    _commonAvatarBuilder = commonAvatarBuilder;
    _showDesktopPopupFunc = showDesktopPopupFunc;
    _networkImageCacheManager = networkImageCacheManager;
    _messageSummaryGetter = messageSummaryGetter;
  }

  static CacheManager? get networkImageCacheManager => _networkImageCacheManager;

  static MessageSummaryGetter? get messageSummaryGetter => _messageSummaryGetter;

  static showDesktopPopup({
    TencentCloudChatPopupOperationKey? operationKey,
    required BuildContext context,
    required Widget Function(VoidCallback closeFunc) child,
    double? width,
    double? height,
    Offset? offset,
    String? initText,
    BorderRadius? borderRadius,
    bool? isDarkBackground,
    String? title,
    VoidCallback? onSubmit,
    Widget? submitWidget,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    final bool? res = await _showDesktopPopupFunc?.call(
      context: context,
      child: child,
      width: width,
      height: height,
      offset: offset,
      initText: initText,
      borderRadius: borderRadius,
      isDarkBackground: isDarkBackground,
      title: title,
      onSubmit: onSubmit,
      submitWidget: submitWidget,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
    if (res != true) {
      TencentCloudChatDesktopPopup.showPopupWindow(
        operationKey: operationKey ?? TencentCloudChatPopupOperationKey.custom,
        context: context,
        child: child,
        width: width,
        height: height,
        offset: offset,
        initText: initText,
        borderRadius: borderRadius,
        isDarkBackground: isDarkBackground = true,
        title: title,
        onSubmit: onSubmit,
        submitWidget: submitWidget,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    }
  }

  static Widget getCommonAvatarBuilder({
    required TencentCloudChatAvatarScene scene,
    double? width,
    double? height,
    double? borderRadius,
    required List<String?> imageList,
    Decoration? decoration,
  }) {
    Widget? widget;

    if (_commonAvatarBuilder != null) {
      widget = _commonAvatarBuilder!(
        scene: scene,
        width: width,
        height: height,
        borderRadius: borderRadius,
        imageList: imageList,
        decoration: decoration,
      );
    }
    return widget ??
        TencentCloudChatAvatar(
          scene: scene,
          width: width,
          height: height,
          borderRadius: borderRadius,
          imageList: imageList,
          decoration: decoration,
        );
  }
}

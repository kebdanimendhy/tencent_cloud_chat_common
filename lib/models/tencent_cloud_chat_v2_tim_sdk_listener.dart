import 'package:tencent_cloud_chat_common/tencent_cloud_chat.dart';

typedef OnReceiveNewMessage = void Function(V2TimMessage message);

/// by dq
/// 为了不修改 tencent_cloud_chat_sdk
/// 在这里新增一个类来扩展接口
class TencentCloudChatV2TimSDKListener extends V2TimSDKListener {
  OnReceiveNewMessage? onReceiveNewMessage;
  TencentCloudChatV2TimSDKListener({
    super.onConnectFailed,
    super.onConnectSuccess,
    super.onConnecting,
    super.onKickedOffline,
    super.onSelfInfoUpdated,
    super.onUserSigExpired,
    super.onUserStatusChanged,
    super.onLog,
    super.onUserInfoChanged,
    super.onAllReceiveMessageOptChanged,
    super.onExperimentalNotify,
    super.onUIKitEventEmited,
    super.onPluginEventEmited,
    this.onReceiveNewMessage,
  });
}

extension TencentCloudChatV2TimSDKListenerExt on V2TimSDKListener {
  void handleReceiveNewMessage(V2TimMessage message) {
    if (this is TencentCloudChatV2TimSDKListener) {
      final listener = this as TencentCloudChatV2TimSDKListener;
      listener.onReceiveNewMessage?.call(message);
    }
  }
}

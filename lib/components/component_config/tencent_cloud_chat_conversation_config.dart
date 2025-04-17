import 'package:tencent_cloud_chat_common/data/conversation/tencent_cloud_chat_conversation_data.dart';
import 'package:tencent_cloud_chat_common/tencent_cloud_chat.dart';

typedef TencentCloudChatConversationFilter = bool Function(V2TimConversation conversation);

class TencentCloudChatConversationConfig {
  // A configuration option that determines whether to combine Conversation and Message on a single widget when rendering on Desktop.
  bool _useDesktopMode;

  // A configuration option that determines whether to combine Conversation and Message on a single widget when rendering on Desktop.
  bool get useDesktopMode => _useDesktopMode;

  TencentCloudChatConversationFilter? _conversationFilter;

  TencentCloudChatConversationFilter? get conversationFilter => _conversationFilter;

  bool _showListHeaderWhenListEmpty;

  bool get showListHeaderWhenListEmpty => _showListHeaderWhenListEmpty;

  TencentCloudChatConversationConfig({
    bool useDesktopMode = true,
    TencentCloudChatConversationFilter? conversationFilter,
    bool showListHeaderWhenListEmpty = true,
  })  : _useDesktopMode = useDesktopMode,
        _conversationFilter = conversationFilter,
        _showListHeaderWhenListEmpty = showListHeaderWhenListEmpty;

  void setConfigs({
    bool? useDesktopMode,
    TencentCloudChatConversationFilter? conversationFilter,
    bool? showListHeaderWhenListEmpty,
  }) {
    _useDesktopMode = useDesktopMode ?? _useDesktopMode;
    _conversationFilter = conversationFilter ?? _conversationFilter;
    _showListHeaderWhenListEmpty =
        showListHeaderWhenListEmpty ?? _showListHeaderWhenListEmpty;
    TencentCloudChat.instance.dataInstance.conversation
        .notifyListener(TencentCloudChatConversationDataKeys.conversationConfig);
  }
}

enum DynamicLinkEnum {
  AddMemberPage,
  CartPage,
  ChatPage,
  ContactUsPage,
  CreateAlbum,
  CreateEventPage,
  CreatePollPage,
  CreatePostPage,
  CreateWill,
  EarnPage,
  FamilyTreePage,
  FaqPage,
  FeedbackPage,
  ForeRoomPage,
  LanguagesPage,
  MyRewardsPage,
  NotificationPage,
  OrderListingPage,
  PostDetailPage,
  PrivacyPolicyPage,
  ProductListingPage,
  RedeemPage,
  RefundCancellationPolicyPage,
  ShippingDeliveryPolicyPage,
  TermsAndConditionPage
}

extension EnumValue on DynamicLinkEnum {
  String get value {
    switch (this) {
      case DynamicLinkEnum.AddMemberPage:
        return "addMember";
      case DynamicLinkEnum.CartPage:
        return "cart";
      case DynamicLinkEnum.ChatPage:
        return "chat";
      case DynamicLinkEnum.ContactUsPage:
        return "contactus";
      case DynamicLinkEnum.CreateAlbum:
        return "album";
      case DynamicLinkEnum.CreateEventPage:
        return "createEvent";

      case DynamicLinkEnum.CreatePollPage:
        return "createPoll";

      case DynamicLinkEnum.CreatePostPage:
        return "createPost";

      case DynamicLinkEnum.CreateWill:
        return "will";

      case DynamicLinkEnum.EarnPage:
        return "earn";

      case DynamicLinkEnum.FamilyTreePage:
        return "familytree";

      case DynamicLinkEnum.FaqPage:
        return "settings_faq";
      case DynamicLinkEnum.FeedbackPage:
        return "settings_feedback";
      case DynamicLinkEnum.ForeRoomPage:
        return "foreroom";
      case DynamicLinkEnum.LanguagesPage:
        return "settings_language";
      case DynamicLinkEnum.MyRewardsPage:
        return "myrewards";

      case DynamicLinkEnum.NotificationPage:
        return "notifications";
      case DynamicLinkEnum.OrderListingPage:
        return "order_listing";

      case DynamicLinkEnum.PostDetailPage:
        return "post_details";
      case DynamicLinkEnum.PrivacyPolicyPage:
        return "privacy_policy";

      case DynamicLinkEnum.ProductListingPage:
        return "productListing";
      case DynamicLinkEnum.RedeemPage:
        return "redeem";
      case DynamicLinkEnum.RefundCancellationPolicyPage:
        return "redeem";
      case DynamicLinkEnum.ShippingDeliveryPolicyPage:
        return "shipping_delivery_policy";

      case DynamicLinkEnum.TermsAndConditionPage:
        return "terms_conditions";
    }
  }
}

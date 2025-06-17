// Dev
const String baseUrlDebug = "https://kintree.info/";
// const String baseUrlDebug = "https://kintree.com/release/";

const String newBaseUrlDebug = "https://api.kintree.info";
// Prod
const String baseUrlRelease = "https://api.kintree.com";

/// OnBoarding Login Flow Api
const String apiGetCountryList = "services/user/getCountriesList";
const String apiVerifyUserExist = "services/user/emailMobileChkNew";
// const String apiForgetPassword = "services/user/forgotUsernamePass";
// const String apiVerifyEmailOtp = "services/user/emailOtpVerify";
const String apiAddUserBasicDetails = "services/user/registerWithOtp";
// const String apiLoginWithUserNamePassword = "services/user/loginUserAndroid";
const String apiGetAuthTokenForLoginUser = "services/user/loginWithOtp";
// const String apiResetPassword = "services/user/resetPassword";
const String apiSkipMemberAddition = "services/user/skipVerification";
// const String apiAddMember = "services/member/addmember";
// const String apiEditMember = "services/member/editmember";
const String apiDeleteDeviceToken = "services/profile/deleteDeviceToken";
const String apiAddDeviceToken = "services/profile/deviceToken";

// Profile
const String apiGetRegionalList = "services/user/getReligionList";
const String apiGetUserProfileDetails = "services/profile/getProfileNew";
const String apiGetMotherTongueList = "services/user/getMotherTongueList";
const String apiGetLanguagesKnownList = "services/user/getLangKnownList";
const String apiGetEducationalList = "services/profile/getEducationListNew";
const String apiGetInterestList = "services/user/getInterestList";
const String apiProfileEditForm = "services/profile/editProfileNew";
const String apiProfileEmailMobileCheck = "services/user/emailMobileChk";
const String apiProfileEmailOtpVerify = "services/user/verifyOtp";

const String apiAddEducationForm = "services/profile/addEducation";
const String apiUpdateEducationForm = "services/profile/updateEducation";
const String apiDeleteEducationForm = "services/profile/deleteEducation";

const String apiAddInterest = "services/profile/addInterestNew";
const String apiDeleteInterest = "services/profile/deleteInterestNew";
const String apiLocationSearch =
    "https://maps.googleapis.com/maps/api/place/autocomplete/json";
const String apiUploadProfileImage = "services/user/uploadProfileImage";
const String apiUploadCoverImage = "services/profile/uploadCoverImage";
//
// Post
const String apiPostGetFeeling = "services/post/getFeelings";
const String apiTenorGif = "https://g.tenor.com/v1/search";

// Foreroom
// services/album/getForeroomPosts
const String apiGetForeRoomPost = "services/album/getForeroomPosts";
// const String apiCreateForeRoomPost = "services/album/createPost";
const String apiUpdateForeoomPost = "services/album/updatePost";
// const String apiCreatePoll = "services/poll/createPoll";
const String apiLikeDislkePost = "services/post/updatePostLikeDislike";
const String apiHidePost = "services/album/hidePost";
// services/poll/getVoteList
// const String apiGetPollResult = "services/poll/getVoteList";
const String apiDeletePost = "services/album/deletePost";
const String apiDeleteMedia = "services/album/deleteImageOnEdit";
// const String apiVotePoll = "services/poll/addVote";
const String apiGetMedia = "services/user/getAll";
// const String apiCreateAlbum = "services/album/createPostAlbum";
const String apiGetAlbumDetail = "services/post/getAlbumDetails";
// const String apiUpdateAlbum = "services/album/updateAlbum";
const String apiDeleteAlbum = "services/album/deleteAlbum";
const String apiUpdatePassword = "services/user/updatePass";
const String apiSubmitUserFeedback = "services/user/userFeedback";
const String apiDeleteUserAccount = "services/user/updateAccountStatus";
// comment
const String apiGetPostDetail = "services/album/getPostAndroid";

// Events
//
const String apiGetLocationDetails =
    "https://maps.googleapis.com/maps/api/place/details/json";
const String apiGetEventCategoryList = "services/event/categoryListing";
const String apiCreateEvent = "services/event/createEvent";
const String apiGetEventList = "services/event/getEventList";
const String apiDeleteEvent = "services/event/deleteEvent";
const String apiUpdateEvent = "services/event/updateEvent";

// get tree

// services/f_tree/getJsonFile'

// const String apiGetUserTree = "services/f_tree/getJsonFile";
const String apiGetPublicProfile = "services/profile/getPublicProfileNew";
// const String apiGetSelectedMemberProfile = "services/member/viewmember";
const String apiGetTreeRelation = "services/member/getrelations";
const String apiReloadFamilyTree = "services/f_tree/reloadJsonFile";
// services/profile/getPublicMembers'
const String apiGetPublicMember = "services/profile/getPublicMembers";
const String apiMymember = "services/profile/getmembers";
const String apiGetSecondRelation = "services/member/getsecondrelationdd";
// services/member/deletemember
// const String apiDeleteMember = "services/member/deletemember";
const String apiCheckAccountStatus = "services/member/checkAddStatus";

// Comments

const String apiAddPostComment = "services/post/addPostCommentAndroid";
const String apiLikeDislikeComment = "services/post/updateCommentLikeDislike";
const String apiEditDeleteComment = "services/post/updatedeletecomment";

// Dna

const String apiDnaGetBannerList = "services/v2/ecommerce/bannerslisting";
const String apiDnaGetProductList = "services/v2/ecommerce/productlisting";
const String apiDnaProductDetails = "services/v2/ecommerce/productdetails";
const String apiDnaAddOrRemoveFromCart = "services/v2/ecommerce/addremovecart";
const String apiDnaGetCartCount = "services/v2/ecommerce/getcartcount";
const String apiDnaGetCart = "services/v2/ecommerce/getmycart";
const String apiAddRemoveCoupon = "services/v2/ecommerce/applyremovecoupon";
const String apiPlaceOrder = "services/v2/ecommerce/orderplace";
const String apiGetMyOrders = "services/v2/ecommerce/myorders";
const String apiAddAddress = "services/v2/ecommerce/addeditaddress";
const String apiGetUserAddress = "services/v2/ecommerce/getaddress";
const String apiDeleteAddress = "services/v2/ecommerce/deleteaddress";
const String apiConfirmUserOrder = "services/v2/ecommerce/orderconfirm";
const String apiGetOrderDetails = "services/v2/ecommerce/orderDetails";
const String apiGetFaq = "/api/v1/faqs?is_app=1";
//  "services/user/getFaqs";
const String apiWillUpdatePersonalInfo = "services/v2/will/UpatePersonalInfo";
const String apiWillUpdateBeneficary = "services/v2/will/UpateBeneficiaryInfo";
const String apiWillUpdateAllocation = "services/v2/will/UpateAllocationInfo";
const String apiWillUpdateExecutor = "services/v2/will/UpateExecutorInfo";
const String apiWillUpdateSelfie = "services/v2/will/UpdateVerificationInfo";
const String apiWillPreviewUserWill = "services/v2/will/previewWill";
const String apiWillGetUserWill = "services/v2/will/GetWill";
const String apiWillDeleteWill = "services/v2/will/DeleteWill";

// Razorpay

const String apiDnaCreateTransactionId =
    "services/v2/ecommerce/createtransactionid";

// will Auth

const String apiWillAuthOtp = "services/v2/will/willOtpAuth";

// Rewards
const String apiRewardGetUserReward = "services/v2/rewards/myRewards";
const String apiRewardsGetTransactions = "/api/v1/kin-coins/transactions";
// "services/v2/rewards/rewardsTransactionListing";

const String apiRewardsGetTabDetails = "/api/v1/kin-coin-reward-events";
const String apiRedeemCoins = "/api/v1/kin-coins/redeem";
// "services/v2/rewards/rewardsListing";
const String apiApplyKinCoins = "services/v2/rewards/applycoins";
const String apiCheckAppVersion = "services//user/appCheck";
const String apiGetWillOccupation = "services/v2/will/GetOccupationList";

/// App update check

const String apiLogin = "/api/v1/login";

/// Auth-new

// const String apiCheckAppVersion = "/api/v1/check-app-version-and-update-availability";

const String apiSendOtp = "/api/v1/send-otp/login-or-register";
const String apiVerifyOtp = "/api/v1/verify-otp/login-or-register";
const String apiChangeContactSendOtp =
    "/api/v1/user/send-otp-to-change-contact";
const String apiChangeContactVerifyOtp =
    "/api/v1/user/verify-otp-and-change-contact";
const String apiGetUserProfile = "/api/v1/profile";
const String apiLogoutUser = "/api/v1/logout";
// const String apiCompleteRegistration = "/api/v1/complete-registration";
//!
const String apiCompleteRegistration = "/api/v1/registration";

const String apiForgetPassword = "/api/v1/send-otp/forgetten-";
const String apiVerifyEmailOtp = "/api/v1/verify-otp/forgetten-";
const String apiResetPassword = "/api/v1/reset-password";
const String apiLoginWithUserNamePassword = "/api/v1/login";

/// Post module
const String apiCreateAttachments = "/api/v1/attachments";
const String apiCreateForeRoomPost = "/api/v1/posts";

/// Create album
const String apiCreateAlbum = "/api/v1/albums";
const String apiGetsAlbum = "/api/v1/albums";
const String apiUpdateAlbum = "/api/v1/albums/:";

/// Foreroom-new

const String apiGetPosts = "/api/v1/posts";

/// Events

const String apiGetEvents = "/api/v1/events";
const String apiCreateEvents = "/api/v1/events";
const String apiGetCategoryList = "/api/v1/event-categories";

/// Create poll
const String apiCreatePoll = "/api/v1/polls";
const String apiDeletePoll = "/api/v1/polls/";
const String apiVotePoll = "/api/v1/polls/";

/// Family tree

const String apiMemberProfile = "/api/v1/members-profile";
const String apiGetUserTree = "/api/v1/family-tree";
const String apiAddMember = "/api/v1/family-tree/members";
const String apiGetTreeMembers = "/api/v1/family-tree/members";
const String apiDeleteMember = "/api/v1/family-tree/members/";
const String apiGetSelectedMemberProfile = "/api/v1/members-profile/";

const String apiEditMember = "/api/v1/family-tree/members/";

/// Will

const String apiGetWill = "/api/v1/will";

///Profile
const String apiGetUserCompleteInfo = "/api/v1/user/profile";
const String apiUpdateProfileImage = "/api/v1/user/change-profile-image";
const String apiUpdateCoverImage = "/api/v1/user/change-cover-image";

///Additional
const String apiGetInterestsList = "/api/v1/interests";
const String apiGetFeelingsList = "/api/v1/feelings";
const String apiGetOccupationsList = "/api/v1/occupations";
const String apiGetEducationTypesList = "/api/v1/education-types";
const String apiGetDesignationList = "/api/v1/designations";
const String apiGetLanguagesList = "/api/v1/languages";
const String apiGetRegionalEthnicityList = "/api/v1/religions";
const String apiGetKinCoinRewardEventList = "/api/v1/kin-coin-reward-events";
const String apiGetCompleteRegionalEthnicityList =
    "/api/v1/religions-all-in-one";
const String apiEditBasicUserInfo = "/api/v1/user/basic-info";
const String apiEditAdditionalUserInfo = "/api/v1/user/additional-info";
const String apiEditRegionalUserInfo = "/api/v1/user/regional-info";
const String apiUpdateEducationalUserInfo = "/api/v1/user/educations";
const String apiUpdateInterest = "/api/v1/user/interests";
const String apiChangeContactPrivacy = "/api/v1/user/change-contact-privacy";
const String apiChangePassword = "/api/v1/user/change-password";

///Custom
const String apiAddCustomCaste = "/api/v1/user/store-custom-castes";
const String apiAddCustomSect = "/api/v1/user/store-custom-sects";
const String apiAddCustomGotra = "/api/v1/user/store-custom-gotras";
const String apiAddCustomInterest = "/api/v1/user/store-custom-interests";

///Configuration
const String apiAddUserConfig = "/api/v1/user/configurations";

/// Country list
const String apiGetCountries = "/api/v1/countries";

/// App Setting
const String apiGetAppSettings = "/api/v1/app-settings";

/// Account Management

const String apiDeleteOrDeactivate =
    "/api/v1/user/settings/deactivate-or-deletion";

/// Feedback
const String apiPostFeedback = "/api/v1/user/feedback";
const String apiSendDeviceToken = "/api/v1/user/device-notification-token";
const String apiSendOtpVerifyUser = "/api/v1/send-otp/verify-user";
const String apiVerifyOtpVerifyUser = "/api/v1/verify-otp/verify-user";
const String apiGetFaqList = "/api/v1/faqs";

const String apiGetNotifications = "/api/v1/user/notifications";

/// Global Search
const String apiGlobalSearch = "/api/v1/search-users?q=";

/// Redeem Products

const String apiRedeemProducts =
    "https://kintree.com/wp-json/wc/v3/products?category=35";

const String apiGetKinCoins = "/api/v1/user/kincoins-balance";

/// Godfather
const String apiAddOtherGodfather = "/api/v1/godfather";
// recipe
const String apiRecipe = "/api/v1/recipes";
const String apiGetRecipe = "/api/v1/recipe-categories";

/// Astrology
const String apiGetZodiacSigns = "/api/v1/zodiac-signs";

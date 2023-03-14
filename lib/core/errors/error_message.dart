class ErrorMessage {
  //todo separate error key collection (consider i10n localization dictionary for it)

  static const notFound = 'not found';

  static const pageNotFound = 'Page not found';
  static const pageNotFoundKey = 'page_not_found';

  static const authorizationFailed = 'Authorization failed';
  static const authorizationFailedKey = 'auth_failed';

  static const unknownServerError = 'Unknown server error';
  static const unknownServerErrorKey = 'unknown_server_error';

  static const pageMustBeInteger = 'Parameter page must be integer';
  static const pageMustBeIntegerKey = 'page_must_be_integer';

  static const perPageMustBeInteger = 'Parameter per_page must be integer';
  static const perPageMustBeIntegerKey = 'per_page_must_be_integer';

  static const orderMustBeAscDsc =
      'Parameter \'order\' must be \'asc\' or \'dsc\'';
  static const orderMustBeAscDscKey = 'order_must_be_asc_dsc';

  static const offsetMustBeInteger = 'Parameter offset must be integer';
  static const offsetMustBeIntegerKey = 'offset_must_be_integer';

  static const limitMustBeInteger = 'Parameter limit must be integer';
  static const limitMustBeIntegerKey = 'limit_must_be_integer';

  static const fieldOrderByNoExist = 'Field in orderBy is not exist';
  static const fieldOrderByNoExistKey = 'field_in_orderBy_not_exist';

  static const avatarNotFound = 'Avatar not found';
  static const avatarNotFoundKey = 'avatar_not_found';

  static const notImage = 'Not image';
  static const notImageKey = 'not_image';

  static const noPermissionToCreateUser =
      'You don\'t have permission to create a user';
  static const noPermissionToCreateUserKey = 'no_permission_to_create_user';

  static const emailAlreadyLinked =
      'The email is already linked to another event. Please enter the original email';
  static const emailAlreadyLinkedKey = "email_already_linked";

  static const unknownUserError =
      'User not found according to the specified parameters';
  static const unknownUserErrorKey = 'user_not_found';

  static const filterIsEmpty = 'Filter is empty';
  static const filterIsEmptyKey = 'filter_is_empty';
}

class ApiEndpoints {
  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refresh = '/auth/refresh';
  static const String logout = '/auth/logout';
  static const String currentUser = '/auth/me';

  // Receipts
  static const String receipts = '/receipts';
  static String receiptDetails(String id) => '/receipts/$id';
  static String receiptSplit(String id) => '/receipts/$id/split';

  // Uploads
  static const String upload = '/uploads';

  // Households
  static const String households = '/households';
  static String householdDetails(String id) => '/households/$id';
  static String householdBalances(String id) => '/households/$id/balances';
  static String householdSettlements(String id) => '/households/$id/settlements';
  static String householdLedger(String id) => '/households/$id/ledger';
  static const String completeSettlement = '/settlements/complete';

  // Analytics
  static const String analyticsDashboard = '/analytics/dashboard';
  static const String analyticsMonthly = '/analytics/monthly';
  static const String analyticsStores = '/analytics/stores';
  static const String analyticsProducts = '/analytics/products';
}

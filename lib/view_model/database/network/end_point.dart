class EndPoints {
  static const String googleApiKey = 'AIzaSyCRQwDr5899Gir1dm7zudCMIdRw8eaIQto';
  static const String baseUrl =
      'https://furnimove20240301161609.azurewebsites.net';

  static const String login = '/api/Account/login';
  static const String logout = '/api/Account/logout';
  static const String resetPaswword = '/api/Account/resetPassword';
  static const String confirmEmail = '/api/Account/sendEmailConfirmation';
  static const String register = '/api/Account/register';
  static const String updateUser = '/api/Account/updateUser';
  static const String getUser = '/api/Account/getCurrentUser';
  static const String addUserImg = '/api/Account/addUserImg';
  static const String deleteUserImg = '/api/Account/deleteUserImg';

  static const String adminGetAllRequests = '/api/Admin/GetAllMoveRequests';
  static const String getCreatedRequests =
      '/api/Admin/getMoveRequestsByStatus?status=created';
  static const String getOnGoingRequests =
      '/api/Admin/getMoveRequestsByStatus?status=Ongoing';
  static const String getWaitingRequests =
      '/api/Admin/getMoveRequestsByStatus?status=waiting';
  static const String getCompletedRequests =
      '/api/Admin/getMoveRequestsByStatus?status=completed';
  static const String getMoveRequestById = '/api/Admin/getMoveRequestById';
  static const String getUsersByRole = '/api/Admin/getUsersByRole';

  static const String addTruck = '/api/ServiceProvider/AddTruck';
  static const String getAllMoveOffersByServiceProvider =
      '/api/ServiceProvider/GetAllMoveOffersByServiceProvider';
  static const String updateTruck = '/api/ServiceProvider/UpdateTruck';
  static const String getCreatedMoveRequests =
      '/api/ServiceProvider/GetCreatedMoveRequests';
  static const String createOffer = '/api/ServiceProvider/CreateMoveOffer';
  static const String currentMove = '/api/ServiceProvider/GetTodaysMove';
  static const String getTruck = '/api/ServiceProvider/GetTruck';
  static const String updateTruckLocation =
      '/api/ServiceProvider/UpdateTruckLocation';
  static const String getAllMovesBySeriviceProvider =
      '/api/ServiceProvider/GetMoveHistory';
  static const String startMoveServiceProvider =
      '/api/ServiceProvider/StartMove';
  static const String endMoveServiceProvider = '/api/ServiceProvider/EndMove';

  static const String customerCreateLocation = '/api/Customer/CreateLocation';
  static const String customerCreateMoveRequest =
      '/api/Customer/CreateMoveRequest';
  static const String customerGetOffers = '/api/Customer/GetOffers';
  static const String customerGetCurrentMove = '/api/Customer/GetCurrentMove';
  static const String customerGetHistory = '/api/Customer/GetHistory';
  static const String customerRate = '/api/Customer/GetHistory';
}

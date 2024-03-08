import '/api/place_api_provider.dart';
import '/model/place.dart';
import '/model/suggestion.dart';

class AddressService {
  AddressService(
      this.sessionToken, this.mapsApiKey, this.componentCountry, this.language,
      {this.types}) {
    apiClient = PlaceApiProvider(
        sessionToken, mapsApiKey, componentCountry, language,
        types: types);
  }

  final String sessionToken;
  final String mapsApiKey;
  final String? componentCountry;
  final String? language;
  final List<String>? types;
  late PlaceApiProvider apiClient;

  Future<List<Suggestion>> search(String query,
      {bool includeFullSuggestionDetails = false,
      bool postalCodeLookup = false}) async {
    return await apiClient.fetchSuggestions(query,
        includeFullSuggestionDetails: includeFullSuggestionDetails,
        postalCodeLookup: postalCodeLookup);
  }

  Future<Place> getPlaceDetail(String placeId) async {
    Place placeDetails = await apiClient.getPlaceDetailFromId(placeId);
    return placeDetails;
  }
}

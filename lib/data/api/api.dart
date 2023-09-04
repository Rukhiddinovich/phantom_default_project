import 'package:default_project/data/models/country_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../queries/country_queries.dart';

class GetCountryRequestFailure implements Exception {}

class CountryApiClient {
  const CountryApiClient({required this.graphQLClient});

  final GraphQLClient graphQLClient;

  factory CountryApiClient.create() {
    final httpLink = HttpLink('https://spacex-production.up.railway.app/');
    final link = Link.from([httpLink]);

    return CountryApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  Future<List<CountryModel>> getCountry() async {
    final result = await graphQLClient.query(
      QueryOptions(document: gql(countryQuery)),
    );

    if (result.hasException) throw GetCountryRequestFailure();
    return (result.data?['ships'] as List?)
            ?.map(
                (dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
  }
}

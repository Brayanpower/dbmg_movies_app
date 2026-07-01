import 'package:bdmg_movies_app/domain/domain.dart';
import 'package:bdmg_movies_app/infrastructure/infrastructure.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath.isEmpty
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
        : 'https://static.vecteezy.com/system/resources/previews/022/058/960/non_2x/no-image-available-icon-vector.jpg',
    character: cast.character,
  );
}

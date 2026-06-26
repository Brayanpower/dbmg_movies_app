class ActorMapper {
  static Actor castToEntity(Cast cast)=>Actor(
    id:cast.id,
    name: cast.name,
    profilePath:
    cast.profilePath.esEmpty ? 'https://image.tmdb.org.t/p/w500${ cast.profilePath}'
    : 'https://cdn-icons-png.flaticon.com/512/17003/17003579.png  ', cast.profilePath,
    character: cast.character
  )
}
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users
User.create(email: 'test@gmail.com', password: 'password')
User.create(email: 'g@mail.com', password: 'something')
User.create(email: 'all@mail.com', password: 'allmail')

# Users Favorites
# UsersFavorite.create(user_id: 1, country_id: 85)
# UsersFavorite.create(user_id: 1, country_id: 1)
# UsersFavorite.create(user_id: 1, country_id: 42)
# UsersFavorite.create(user_id: 1, country_id: 188)
# UsersFavorite.create(user_id: 1, country_id: 133)
#
# UsersFavorite.create(user_id: 2, country_id: 12)
# UsersFavorite.create(user_id: 2, country_id: 162)
# UsersFavorite.create(user_id: 2, country_id: 43)
# UsersFavorite.create(user_id: 2, country_id: 98)
#
# UsersFavorite.create(user_id: 3, country_id: 215)
# UsersFavorite.create(user_id: 3, country_id: 194)
# UsersFavorite.create(user_id: 3, country_id: 98)
# UsersFavorite.create(user_id: 3, country_id: 138)
# UsersFavorite.create(user_id: 3, country_id: 221)
# UsersFavorite.create(user_id: 3, country_id: 3)
# UsersFavorite.create(user_id: 3, country_id: 85)
# UsersFavorite.create(user_id: 3, country_id: 101)

UsersFavorite.create(user_id: 1, country_id: 1761)
UsersFavorite.create(user_id: 1, country_id: 1904)
UsersFavorite.create(user_id: 1, country_id: 1828)
UsersFavorite.create(user_id: 1, country_id: 1758)
UsersFavorite.create(user_id: 1, country_id: 1922)

UsersFavorite.create(user_id: 2, country_id: 1870)
UsersFavorite.create(user_id: 2, country_id: 1815)
UsersFavorite.create(user_id: 2, country_id: 1845)
UsersFavorite.create(user_id: 2, country_id: 1799)

UsersFavorite.create(user_id: 3, country_id: 1992)
UsersFavorite.create(user_id: 3, country_id: 1858)
UsersFavorite.create(user_id: 3, country_id: 1951)
UsersFavorite.create(user_id: 3, country_id: 1870)
UsersFavorite.create(user_id: 3, country_id: 1761)
UsersFavorite.create(user_id: 3, country_id: 1772)
UsersFavorite.create(user_id: 3, country_id: 1828)
UsersFavorite.create(user_id: 3, country_id: 1958)

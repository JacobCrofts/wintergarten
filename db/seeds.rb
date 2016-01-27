bob = User.create(username: "bob", password: "bob", email: "bob@bob.com")
penny = User.create(username: "penny", password: "penny", email: "penny@penny.com")
8.times do
  User.create(username: Faker::Internet.user_name, password: "pasword", email: Faker::Internet.email)
end
# User.create(username: Faker::Internet.user_name, password: "james", email: "james@james.com")
# User.create(username: Faker::Internet.user_name, password: "melissa", email: "melissa@melissa.com")
# User.create(username: Faker::Internet.user_name, password: "helga", email: "helga@helga.com")
# User.create(username: Faker::Internet.user_name, password: "geronimo", email: "geronimo@geronimo.com")
# User.create(username: Faker::Internet.user_name, password: "buster", email: "buster@buster.com")
# User.create(username: Faker::Internet.user_name, password: "foo", email: "foo@foo.com")
# User.create(username: Faker::Internet.user_name, password: "bar", email: "bar@bar.com")

Film.create(title: Faker::Hipster.sentence(3), runtime: "1:30", genre: "comedy", image: "http://www.kimmelorchard.org/img/icon_eggplant.png", year: 2003, director: "Derpson Herpton", description: "really, really bad comedy movie")
Film.create(title: Faker::Hipster.sentence(3), runtime: "1:31", genre: "horror", image: "http://pngimg.com/upload/eggplant_PNG2771.png", year: 2004, director: "Herpson Derpington", description: "really, really bad horror movie")
Film.create(title: Faker::Hipster.sentence(3), runtime: "1:32", genre: "comedy", image: "http://macdoos.co/wp-content/uploads/2013/05/INGREDIENTS-eggplant.jpg", year: 2005, director: "Derpson Herpton", description: "average comedy movie")
Film.create(title: Faker::Hipster.sentence(3), runtime: "1:33", genre: "horror", image: "http://www.almanac.com/sites/default/files/images/eggplant.jpg", year: 2006, director: "Herpson Derpington", description: "average horror movie")
Film.create(title: Faker::Hipster.sentence(3), runtime: "1:34", genre: "comedy", image: "http://media.mercola.com/assets/images/food-facts/eggplant-fb.jpg", year: 2007, director: "Derpson Herpton", description: "pretty good comedy")

### Create a user with over 50 rated reviews and an avg rating of those reviews >= 3.5
60.times do |t|
  bob.reviews.create(film_id: rand(1..4),
                     title: Faker::Hipster.sentence(1),
                     content: Faker::Hipster.paragraph(10))
  penny.ratings.create(rateable_id: t, rateable_type: "Review", value: 4)
end

### Create a user with over 50 rated reviews and an avg rating of those reviews < 3.5
60.times do |t|
  penny.reviews.create(film_id: rand(1..4),
                     title: Faker::Hipster.sentence(1),
                     content: Faker::Hipster.paragraph(10))
  bob.ratings.create(rateable_id: t+60, rateable_type: "Review", value: rand(1..3))
end

user_counter = 0
while user_counter < 5
  film_counter = 0
  while film_counter < 5
    User.all[user_counter].ratings.create(rateable_id: film_counter + 1,
                                          rateable_type: "Film",
                                          value: rand(1..4))
    User.all[user_counter].reviews.create(film_id: film_counter + 1,
                                          title: Faker::Hipster.sentence(1),
                                          content: Faker::Hipster.paragraph(10))
    User.all[user_counter].reviews[film_counter].comments.create(content: Faker::Hipster.paragraph(3))
    User.all[user_counter].comments.create(content: Faker::Hipster.paragraph(3),
                                          commentable_type: "Film",
                                          commentable_id: film_counter + 1)
    User.all[user_counter].ratings.create(rateable_id: film_counter + 1,
                                          rateable_type: "Review",
                                          value: rand(1..4))
    film_counter += 1
  end
  user_counter += 1
end

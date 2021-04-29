# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

BASE_URL = "https://image.tmdb.org/t/p/w500/"
movies_images = []
html = open("http://tmdb.lewagon.com/movie/top_rated").read 
data = JSON.parse(html)
for i in 0..5
    movies_images << data['results'][i]['poster_path']
end

6.times do 
    Movie.create(
        title: Faker::Movie.title, 
        overview: Faker::Movie.quote, 
        poster_url: "#{BASE_URL}#{movies_images.sample}", 
        rating: rand(0..10)
        )
end

List.create(name: 'Comedy', url_path: 'https://images.unsplash.com/photo-1521337706264-a414f153a5ed?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1416&q=80')
List.create(name: 'Drama', url_path: 'https://images.unsplash.com/photo-1592724217096-618c2d580826?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1652&q=80')
List.create(name: 'Old movies', url_path: 'https://images.unsplash.com/photo-1573502344213-f7407f6685f3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80')

Bookmark.create(movie_id: 1, list_id: 1, comment: "Harry Potter loved this movie")
Bookmark.create(movie_id: 2, list_id: 1, comment: "Micheal Jackson told me about it")
Bookmark.create(movie_id: 3, list_id: 2, comment: "One of the best french movie of all times")
Bookmark.create(movie_id: 4, list_id: 2, comment: "Superhero are badasses in it")
Bookmark.create(movie_id: 5, list_id: 3, comment: "To be watch in fmaily or with friends")
Bookmark.create(movie_id: 6, list_id: 3, comment: "Hello my dear friends")


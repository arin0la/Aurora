# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Video.destroy_all
Sound.destroy_all
MixSound.destroy_all
# User.destroy_all
puts "Cleaning database..."

puts "Creating Videos"

Video.create(mp4: "https://player.vimeo.com/external/471904635.sd.mp4?s=4153bede3242f45adf225979a074d974c91d36c1&profile_id=164&oauth2_token_id=57447761")
Video.create(mp4: "https://player.vimeo.com/external/447887450.sd.mp4?s=3acb4c03767d1acd24eaf7d8c1a613d5d368a076&profile_id=164&oauth2_token_id=57447761")

puts "creating sounds"

Sound.create!(name: "Brook.wav")
Sound.create!(name: "Australian Rainforest.wav")
Sound.create!(name: "golden chant.wav")
Sound.create!(name: "Transformation.wav")

puts "#{Sound.all.count} sounds created"

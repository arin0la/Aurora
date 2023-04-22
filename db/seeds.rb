User.destroy_all
Mix.destroy_all
Sound.destroy_all
MixSound.destroy_all
Video.destroy_all

puts "Cleaning database..."
require "faker"

admin = User.create(email: "admin@aurora.com", password: "123456")
admin.save!

puts "Configuring Videos"
count = 0
videos = []
videos << beach = Video.create!(mp4: "https://player.vimeo.com/external/289258217.sd.mp4?s=50b11b521df767740fa56e4743159474f540afa2&profile_id=164&oauth2_token_id=57447761")
videos << rainforest = Video.create!(mp4: "https://player.vimeo.com/external/471904635.sd.mp4?s=4153bede3242f45adf225979a074d974c91d36c1&profile_id=164&oauth2_token_id=57447761")
videos << desert = Video.create!(mp4: "https://player.vimeo.com/external/384754959.sd.mp4?s=3fb231a8ec07fb6b9ca6fd57e5d1cc5ea59bbc5c&profile_id=164&oauth2_token_id=57447761")
videos << lake = Video.create!(mp4: "https://player.vimeo.com/external/447887450.sd.mp4?s=3acb4c03767d1acd24eaf7d8c1a613d5d368a076&profile_id=164&oauth2_token_id=57447761")

puts "Initializing Sounds"
sounds = []
sounds << sound1 = Sound.create(mp3: "../app/assets/sounds/Australian Rainforest.wav")
sounds << sound2 = Sound.create(mp3: "../app/assets/sounds/Brook.wav")
sounds << sound3 = Sound.create(mp3: "../app/assets/sounds/golden chant.wav")
sounds << sound4 = Sound.create(mp3: "../app/assets/sounds/Transformation.wav")

puts "Creating Mixed Sounds and Mixes"
# mix_sounds = []

4.times do
  mix_sound = MixSound.create(
    name: "Rainforest",
    volume: 10,
    sound: sounds.sample,
    mix: Mix.create!(name: Faker::Cannabis.strain, user: admin, videos_id: videos.sample.id)
  )
  mix_sound.save!
  count += 1
  puts "#{count} mixes made"
end
puts "Done✅"

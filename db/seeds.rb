# frozen_string_literal: true

user1 = User.create(email: "user1@purrweb.com", password: "123456", password_confirmation: "123456")
user2 = User.create(email: "user2@purrweb.com", password: "123456", password_confirmation: "123456")

files = Dir.glob(Rails.root.join("data", "*"))

2.times do |e|
  event_user1 = Event.create(name: "Event ##{e}", user_id: user1.id)
  event_user2 = Event.create(name: "Event ##{e}", user_id: user2.id)

  2.times do |d|
    playlist_user1 = Playlist.create(name: "Playlist ##{d}", user_id: user1.id, duration: rand(3600..36000))
    playlist_user2 = Playlist.create(name: "Playlist ##{d}", user_id: user2.id, duration: rand(3600..36000))

    display_user1 = Display.create(name: "Display ##{d} for event ##{e}", event_id: event_user1.id, playlist_id: playlist_user1.id)
    display_user1 = Display.create(name: "Display ##{d} for event ##{e}", event_id: event_user2.id, playlist_id: playlist_user2.id)

    3.times do |s|
      content_user1 = Content.create(content: File.open(files.sample), user_id: user1.id)
      content_user2 = Content.create(content: File.open(files.sample), user_id: user2.id)

      slide_user1 = Slide.create(name: "Slide ##{s} for playlist ##{d}", playlist_id: playlist_user1.id, content_id: content_user1.id, weight: s)
      slide_user2 = Slide.create(name: "Slide ##{s} for playlist ##{d}", playlist_id: playlist_user2.id, content_id: content_user2.id, weight: s)
    end
  end
end

user = User.create(email: "example@purrweb.com", password: "123456", password_confirmation: "123456")
files = Dir.glob(Rails.root.join("data", "*"))

3.times do |e|
  event = Event.create(name: "Event ##{e}", user_id: user.id)
  3.times do |d|
    playlist = Playlist.create(name: "Playlist for display ##{d}", duration: rand(3600..36000))
    display = Display.create(name: "Display ##{d} for event ##{event.id}", event_id: event.id, playlist_id: playlist.id)
    3.times do |s|
      content = Content.create(content: File.open(files.sample))
      slide = Slide.create(playlist_id: playlist.id, content_id: content.id, weight: s)
    end
  end
end

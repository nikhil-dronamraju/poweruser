module SmartGoalsHelper
  def select_user_tracks(user)
    user_tracks = user.user_tracks
    selection = []
    user_tracks.each do |user_track|
      element = []
      track = user_track.track.title
      element << track
      element << user_track.id
      selection << element
    end

    p "Starting debugging here: \n"
    pp selection
    selection
  end
end

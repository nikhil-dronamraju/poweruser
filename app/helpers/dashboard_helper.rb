module DashboardHelper
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

    selection
  end

  def format_date(date)
    date.strftime("%m/%d/%Y")
  end

  def days_remaining(start_date, end_date)
    (end_date - start_date).to_i
  end
end

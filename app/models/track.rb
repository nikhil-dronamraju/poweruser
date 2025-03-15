class Track < ApplicationRecord
  belongs_to :user
  has_many :smart_goals, dependent: :destroy
  validates :title, presence: { message: "Must have a title." }
  validates :icon, presence: { message: "Must have a icon." }

  def self.generate_from_onboarding(track_params)
    all_titles = []
    track_params.each do |track_param|
      title = track_param[1][:title]
      all_titles << title
    end
    if all_titles.compact_blank.empty?
      raise StandardError.new("No tracks are filled out. Please fill out at least one or use the defaults.")
    else
      track_params.each do |track_param|
        title = track_param[1][:title]
        icon = track_param[1][:icon]
        unless title.blank?
          if icon.present?
            Track.create(title: title, icon: icon)
          else
            Track.create(title: title)
          end
        end
      end
    end
  end
end

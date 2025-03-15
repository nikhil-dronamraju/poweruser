module AuthHelper
  def user_generic_errors(err_messages)
    filtered_messages = []
    valid_keys = [ :username, :name, :password ]
    if err_messages.present?
      err_messages.each do |err_message|
        if valid_keys.include? err_message[0].to_sym
          filtered_messages << err_message[1]
        end
      end
    end

    filtered_messages.flatten
  end
end

def fa_icon_samples
  [
    "fa-solid fa-dumbbell",
    "fa-solid fa-running",
    "fa-solid fa-bicycle",
    "fa-solid fa-person-walking",
    "fa-solid fa-plane",
    "fa-solid fa-car",
    "fa-solid fa-ship",
    "fa-solid fa-bus",
    "fa-solid fa-mountain",
    "fa-solid fa-users",
    "fa-solid fa-child",
    "fa-solid fa-house-user",
    "fa-solid fa-baby-carriage",
    "fa-solid fa-user-friends",
    "fa-solid fa-laptop",
    "fa-solid fa-mobile-alt",
    "fa-solid fa-camera",
    "fa-solid fa-headphones",
    "fa-solid fa-tv",
    "fa-solid fa-pills",
    "fa-solid fa-stethoscope",
    "fa-solid fa-hospital",
    "fa-solid fa-ambulance",
    "fa-solid fa-first-aid",
    "fa-solid fa-utensils",
    "fa-solid fa-coffee",
    "fa-solid fa-cocktail",
    "fa-solid fa-pizza-slice",
    "fa-solid fa-burger",
    "fa-solid fa-wallet",
    "fa-solid fa-credit-card",
    "fa-solid fa-piggy-bank",
    "fa-solid fa-calculator",
    "fa-solid fa-building-columns",
    "fa-solid fa-leaf",
    "fa-solid fa-sun",
    "fa-solid fa-tree",
    "fa-solid fa-water",
    "fa-solid fa-snowflake",
    "fa-solid fa-book",
    "fa-solid fa-graduation-cap",
    "fa-solid fa-chalkboard-teacher",
    "fa-solid fa-pencil-alt",
    "fa-solid fa-school",
    "fa-solid fa-film",
    "fa-solid fa-guitar",
    "fa-solid fa-gamepad",
    "fa-solid fa-headphones",
    "fa-solid fa-music",
    "fa-solid fa-briefcase",
    "fa-solid fa-users-cog",
    "fa-solid fa-clipboard-list",
    "fa-solid fa-chart-line",
    "fa-solid fa-cogs",
    "fa-solid fa-shopping-cart",
    "fa-solid fa-store",
    "fa-solid fa-credit-card",
    "fa-solid fa-tags",
    "fa-solid fa-bag-shopping",
    "fa-solid fa-sun",
    "fa-solid fa-cloud",
    "fa-solid fa-cloud-sun",
    "fa-solid fa-snowflake",
    "fa-solid fa-thunderstorm"
  ]
end

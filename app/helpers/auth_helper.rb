module AuthHelper
  def user_generic_errors(err_messages)
    filtered_messages = []
    valid_keys = [:username, :name, :password]
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

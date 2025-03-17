module ErrorHandling
  extend ActiveSupport::Concern
  def format_errors(errors)
    puts errors.messages
    errors.messages.values.flatten
  end
end

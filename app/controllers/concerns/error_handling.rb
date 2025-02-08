module ErrorHandling
  extend ActiveSupport::Concern
  def format_errors(errors)
    errors.messages.values.flatten
  end
end

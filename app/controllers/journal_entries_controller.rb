class JournalEntriesController < ApplicationController
  include Authentication
  before_action :check_logged_in
  def index
    @user = User.find(session[:user_id])
  end

  def new
    @journal_entry = JournalEntry.new
  end

  def create
    journal_entry = JournalEntry.new(journal_entry_params)
    journal_entry.user_id = session[:user_id]
    journal_entry.save
  end

  private

  def journal_entry_params
    params.require(:journal_entry).permit(:title, :content)
  end
end

module ApplicationHelper
  def authorize!
    unless auth_hash['uid']
      redirect_to new_session_path
    end
  end
end

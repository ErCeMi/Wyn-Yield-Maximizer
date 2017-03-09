class ApplicationRecord < ActiveRecord::Base

def current_user
  @current_user ||= Employee.find(session[:user_id]) if session[:user_id]
end
def authorize
  redirect_to '/login' unless current_user
end
  self.abstract_class = true
end

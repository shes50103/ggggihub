class ApplicationController < ActionController::Base
  layout proc{|c| c.request.xhr? ? false : "application" }

end

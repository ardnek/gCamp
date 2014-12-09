class PublicController < ApplicationController
  # views will look for layouts/public then layouts/application
  skip_before_action :require_login

end

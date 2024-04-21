class ApplicationController < ActionController::Base
  include ErrorHandling
  include Pagy::Backend
  include CurrentUser
end

require_relative './config/environment'

require './config/environment'

use Rack::MethodOverride
run ApplicationController
# run TasksController
# run UsersController

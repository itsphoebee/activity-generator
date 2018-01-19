require './config/environment'


use Rack::MethodOverride
use ActivityController
use CategoryController
use UserController
run ApplicationController

require './config/environment'


use Rack::MethodOverride
use CommentController
use ActivityController
use CategoryController
use UserController
run ApplicationController

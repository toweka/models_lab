require "sinatra"
require "sinatra/contrib"
require "sinatra/reloader" if development?
require "pg"
require_relative "../model_lab/controllers/clubs_controller.rb"
require_relative "../model_lab/models/club.rb"

use Rack::MethodOverride
run ClubsController

require "sinatra"
require "sinatra/contrib"
require "sinatra/reloader" if development?
require "pg"
require_relative "../sinatra_intro/controllers/clubs_controller.rb"
require_relative "../sinatra_intro/models/club.rb"

use Rack::MethodOverride
run ClubsController

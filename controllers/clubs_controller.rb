class ClubsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
    "<a href='/clubs'>Clubs Index</a>
    <br>
    <h1>Main Index Page</h1>"

    @clubs = Club.all

  end

  # Index page
  get '/clubs' do
    @title = "Blog Clubs"
    @clubs = Club.all
    erb :'clubs/index'
  end

  # New page
  get '/clubs/new' do
    @club = Club.new

    erb :"clubs/new"
  end

  # Create page
  post "/clubs/" do
    club = Club.new

    club.title = params[:title]
    club.body = params[:body]

    club.save

    redirect '/clubs'

  end

  # Show page
  get '/clubs/:id' do

    id = params[:id].to_i

    @club = Club.find(id)

    erb :"clubs/show"

  end

  # Edit page
  get "/clubs/:id/edit" do
    id = params[:id].to_i

    @club = Club.find(id)

    erb :"clubs/edit"
  end

  # Update page
  put "/clubs/:id" do
    id = params[:id].to_i

    club = Club.find(id)

    club.title = params[:title]
    club.body = params[:body]

    club.save

    redirect "/clubs/#{id}"
  end

  # Destroy page
  delete "/clubs/:id" do
    id = params[:id].to_i

    Club.destroy(id)

    redirect "/clubs"
  end

end

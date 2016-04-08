class RepositoriesController < ApplicationController
  def index
    service = GithubService.new
    #binding.pry
    @repos_array =  service.get_repos
    session[:username] = service.get_username
    render 'index'
  end

  def create
    GithubService.new.create_repo(params[:name])
    redirect_to '/'
  end
end

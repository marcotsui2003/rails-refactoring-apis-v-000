class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    service = GithubService.new
    @repos_array =  service.get_repos
    session[:username] = service.get_username
    render 'repositories/index'
  end
end

class GithubRepo

  attr_reader :name, :url

  def initialize(hash)
    @name = hash["name"]
    @url = hash["html_url"]
  end

  

  def create_repo(repo_name)
    response = Faraday.post "https://api.github.com/user/repos", {name: repo_name}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end


end

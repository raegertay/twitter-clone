class ApisController < ApplicationController

  def retrieve
    # response = Net::HTTP.get(URI("https://api.github.com/users/raegertay"))
    # @user = ActiveSupport::JSON.decode(response)
    @uri = "https://api.github.com/users/raegertay"
    # @service = GetApiService.call(@uri)
    render json: GetApiService.call(@uri)
  end

end

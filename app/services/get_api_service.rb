class GetApiService

  # def initialize(uri)
  #   @uri = uri
  # end

  def self.call(uri)
    response = Net::HTTP.get(URI(uri))
    ActiveSupport::JSON.decode(response)
  end

end

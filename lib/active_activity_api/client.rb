require 'httparty'

module ActiveActivityApi
  class Client
    include HTTParty
    include Active::DataCoercion

    BASE_URL = "http://api.amp.active.com/v2"

    def initialize api_key: ENV['ACTIVE_API_KEY']
      @api_key = api_key
    end

    # Params used by all API calls
    def default_params
      {
        api_key: @api_key,
        per_page: 100
      }
    end
    # HEY!  Move on to RunReg.  Come back to this.

    def search **opts
      # Response in format
      #  {
      #     ...
      #     results: [{
      #       detailPageTemplateId: "",
      #       salesStartDate: "2013-07-22T12:09:21",
      #       ... 
      call_api('search', opts)['results'].map do |activity|
        Active::Activity.new(activity)
      end
    end

    protected

    def call_api path, params = {}
      response = self.class.get(
        "#{BASE_URL}/#{path}", 
        query: default_params.merge(params)
      )
      if response.code == 200
        response = response.parsed_response

        if (error = response['error'])
          raise Error.new error['error_msg']
        else
          response
        end
      else
        raise Error.new response.body
      end
    end
  end
end

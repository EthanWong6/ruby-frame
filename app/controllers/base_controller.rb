require 'validator/length'
class BaseController < Grape::API
  content_type :json, 'application/json'
  default_format :json


  rescue_from Error_404 do |e|
    error!({ messages: e.message }, 404)
  end
  # rescue_from :all do |e|
  #   #   error!({ messages: e.message })
  #   # end
  mount ApiController => '/api'

  route :any, '/*' do
    error! # or something else
  end
end

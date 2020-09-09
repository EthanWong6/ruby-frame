class ApiController < BaseController
  use ApiLogger
  helpers AuthHelper
  helpers DataBuildHelper
  helpers LoggerHelper
  helpers FormatterHelper

  helpers do
    def logger
      ApiController.logger
    end
  end
  before do
    # verify_authorize
    build_log
  end

  mount Api::BookController,with: { endpoint_name: 'book' }
  mount Api::CardController => 'card'
end

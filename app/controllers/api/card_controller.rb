module Api
  class CardController < BaseController
    namespace 'card' do
    get 'index' do
      { message: " card index " }
    end
    end
    resource :book2 do
      get 'index' do
        { message: " book2 index " }
      end
    end
  end
end

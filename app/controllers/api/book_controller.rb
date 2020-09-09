module Api
  class BookController < BaseController
    params do
      optional :id, type: String
    end
    namespace 'book' do
      params do
        optional :name, type: String, except_values: %w(1 2 3)
        optional :title, type: String, length: 3
      end
      get 'index' do
        logger.info "hhhh"
        # data!(params)
        # present declared(params),whit:Entities::Book::Detail
        Entities::Book::Detail.represent declared(params), { type: :full }
      end

      desc '创建学习集' do
      end
      params do
        requires :book, type: Hash do
          optional :title, type: String
          optional :desc, type: String
          optional :state, type: String
        end
      end
      post '/' do
        attrs = declared(params).book.to_hash
        @book = Book.create!(attrs)
        data!(@book)
      end

      desc '学习集详情' do
      end
      params do
        optional :q, type: Hash do
          optional :cards_title_eq, type: String
        end
      end
      get '/' do
        @q     = Book.ransack(params[:q])
        @books = @q.result
        data!(@books)
      end


      route_param :id, requirements: { id: /[0-9]+/ } do
        desc '编辑学习集' do
        end
        params do
          requires :book, type: Hash do
            optional :title, type: String
            optional :desc, type: String
            optional :state, type: String
          end
        end
        put '/' do
          @book = Book.find(params.id)
          @book.update!(declared(params,include_missing: false).book.to_hash)
        end
      end
    end





    params do
      optional :book_id, type: String
    end
    resource :book2 do
      get 'index' do
        { message: "book2 index 参数为#{declared(params).to_json} " }
      end
    end




  end
end

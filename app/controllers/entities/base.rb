module Entities
  class Base < Grape::Entity
    expose :id do |s|
      'llll'
    end

    format_with(:time_format) { |dt| dt&.strftime('%F') }



    with_options(format_with: :time_format) { expose :created_at, :date }
  end
end

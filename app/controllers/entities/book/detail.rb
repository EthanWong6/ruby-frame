module Entities
  module Book
    class Detail < Base
      expose :title, if: -> (book, options) {
        options[:type] == :full
      }
      expose :name, if: { type: :full }
      expose :cards, merge: true, using: Entities::Card::Detail
      expose :date

      private

      def date
        Time.new
      end
    end
  end
end

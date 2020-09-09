class Book < ApplicationRecord
  include AASM

  has_many :cards

  aasm(column: :state) do
    state :save, initial: true, before_enter: Proc.new { do_something("to_be_save by before_enter")  }, display: 'First Stage'
    state :publish, before_enter: Proc.new { do_something("to_be_publish by before_enter")  }, display: 'Second Stage'
    state :cancel, before_enter: Proc.new { do_something("to_be_cancel by before_enter")  }, display: 'Third Stage'

    after_all_transitions :log_status_change

    event :do_publish do
      before do
        puts 'Preparing to do_publish'
      end
      transitions from: :save, to: :publish
    end
    event :do_cancel do
      before do
        puts 'Preparing to do_cancel'
      end
      transitions from: [:save, :publish], to: :cancel
    end

    event :do_save do
      before do
        puts 'Preparing to do_save'
      end
      transitions from: [:cancel, :publish], to: :save
    end
    def do_something(str)
      puts  "=========#{str}"
    end
  end


  def log_status_change
    puts "changing from #{aasm.from_state} to #{aasm.to_state} (event: #{aasm.current_event})"
  end
end

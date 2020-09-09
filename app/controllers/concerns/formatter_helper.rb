module FormatterHelper
  Grape::Entity.format_with :utc do |date|
    date.strftime('%F') if date
  end
end

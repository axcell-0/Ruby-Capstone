# game.rb

require_relative 'item'

class Game < Item
  def initialize(publish_date)
    super(publish_date)
  end

  def can_be_archived?
    super
  end
end

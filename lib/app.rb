# frozen_string_literal: true

class App
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    'Hello world'
  end
end

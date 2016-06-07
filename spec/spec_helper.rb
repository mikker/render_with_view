require 'rspec/core'
require 'render_with_view'

class FakeController
  include RenderWithView

  attr_reader :calls

  def action_name
    :new
  end

  def render(*args)
    (@calls ||= []) << args
  end
end

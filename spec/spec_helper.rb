require 'rspec/core'
require 'render_with_locals'

class FakeController
  include RenderWithLocals

  attr_reader :calls

  def action_name
    :new
  end

  def render(*args)
    (@calls ||= []) << args
  end
end

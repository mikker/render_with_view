require "active_support/concern"
require "render_with_view/version"
require "render_with_view/half_open_struct"

module RenderWithView
  extend ActiveSupport::Concern

  class View < HalfOpenStruct
  end

  included do
    helper_method :view

    def view
      raise ViewNotDefinedError, "View not defined" if !@__view__

      @__view__
    end

    def render_with_view(*args)
      if !args.first.is_a?(Hash)
        tmpl = args.shift
      else
        tmpl = action_name
      end

      view = args.shift
      opts = args.shift || {}

      # save to ivar for testing purposes
      @__view__ = View.new(view)

      render(tmpl, opts)
    end
  end
end

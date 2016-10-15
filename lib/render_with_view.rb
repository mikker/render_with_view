require 'render_with_view/version'
require 'render_with_view/half_open_struct'

module RenderWithView
  class View < HalfOpenStruct; end

  def self.included kls
    kls.class_eval do
      def render_with_view *args
        if !args.first.is_a?(Hash)
          tmpl = args.shift
        else
          tmpl = action_name
        end
        locals = args.shift
        opts = args.shift || {}

        # save to ivar for testing purposes
        @__view__ = View.new(locals)

        render tmpl, opts.merge(locals: { view: @__view__ })
      end
    end
  end
end


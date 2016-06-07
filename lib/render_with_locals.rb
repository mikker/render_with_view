require 'render_with_locals/half_open_struct'

module RenderWithLocals
  class View < HalfOpenStruct; end

  def self.included kls
    kls.class_eval do
      def render_with_locals *args
        tmpl = args.length == 2 ? args.shift : action_name
        locals = args.shift

        # save to ivar for testing purposes
        @__view__ = View.new(locals)

        render tmpl, locals: { view: @__view__ }
      end
    end
  end
end


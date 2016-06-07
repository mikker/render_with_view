require 'spec_helper'

RSpec.describe RenderWithLocals do

  describe "#render_with_locals" do
    it "calls render with template and assigned locals" do
      user = { id: 1 }
      ctrl = FakeController.new

      ctrl.render_with_locals :index, user: user

      tmpl, args = ctrl.calls.last
      expect(tmpl).to eq :index
      expect(args[:locals][:view].user).to eq(user)
    end

    it "defaults to action_name template" do
      user = { id: 1 }
      ctrl = FakeController.new

      ctrl.render_with_locals user: user

      tmpl, * = ctrl.calls.last
      expect(tmpl).to eq :new
    end

    it "saves to an instance var behind the scenes" do
      user = { id: 1 }
      ctrl = FakeController.new

      ctrl.render_with_locals :index, user: user

      ivar = ctrl.instance_variable_get(:@__view__)
      expect(ivar).to be_a RenderWithLocals::View
      expect(ivar.user).to eq user
    end
  end

end

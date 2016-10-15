require 'spec_helper'

RSpec.describe RenderWithView do

  describe "#render_with_view" do
    it "calls render with template and assigned view" do
      user = { id: 1 }
      ctrl = FakeController.new

      ctrl.render_with_view :index, user: user

      tmpl, args = ctrl.calls.last
      expect(tmpl).to eq :index
      expect(args[:locals][:view].user).to eq(user)
    end

    it "defaults to action_name template" do
      user = { id: 1 }
      ctrl = FakeController.new

      ctrl.render_with_view user: user

      tmpl, * = ctrl.calls.last
      expect(tmpl).to eq :new
    end

    it "saves to an instance var behind the scenes" do
      user = { id: 1 }
      ctrl = FakeController.new

      ctrl.render_with_view :index, user: user

      ivar = ctrl.instance_variable_get(:@__view__)
      expect(ivar).to be_a RenderWithView::View
      expect(ivar.user).to eq user
    end

    it "includes options" do
      user = { id: 1 }
      opts = { flash: {notice: "YAS!"} }
      ctrl = FakeController.new

      ctrl.render_with_view(:edit, {user: user}, opts)
      tmpl, opts = ctrl.calls.last
      expect(tmpl).to eq :edit
      expect(opts[:flash]).to eq({notice: "YAS!"})
    end
  end

end

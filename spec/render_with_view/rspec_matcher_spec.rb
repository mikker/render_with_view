require "spec_helper"
require "render_with_view/rspec_matcher"

RSpec.describe "RSpec matcher" do
  let(:ctrl) { FakeController.new }
  subject { ctrl.render_with_view(:index, thing: 1) }

  # short form
  it { should(set_view_local(:thing)) }
  it { should_not(set_view_local(:other_thing)) }

  # long form
  it "takes and matches arguments" do
    expect(subject).to(set_view_local(:thing, 1))
    expect(subject).to_not(set_view_local(:thing, 2))
  end

  def assigns(key)
    ctrl.instance_variable_get("@#{key}".to_sym)
  end
end

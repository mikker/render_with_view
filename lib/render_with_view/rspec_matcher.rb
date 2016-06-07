RSpec::Matchers.define :set_view_local do |key, expected = nil|
  match do |block|
    block.call if block && block.is_a?(Proc)

    value = assigns('__view__').send(key.to_sym) rescue nil

    return !!value unless expected

    expect(expected).to eq(value)
  end

  supports_block_expectations

  description do
    msg = "set view local"
    msg += " to equal #{expected.inspect}" if expected
    msg
  end

  failure_message do
    msg = "expected view locals to have key #{key.inspect}"
    msg += " to equal #{expected.inspect}" if expected
    msg
  end

  failure_message_when_negated do
    msg = "expected view locals to not have key #{key.inspect}"
    msg += " to not equal #{expected.inspect}" if expected
    msg
  end
end

require 'spec_helper'

module RenderWithLocals
  RSpec.describe HalfOpenStruct do
    it "can be initialized with a hash, and values read and written" do
      s = HalfOpenStruct.new(name: "Joe")
      expect(s.name).to eq "Joe"

      s.age = 42
      expect(s.age).to eq 42
    end

    it "raises trying to read an unknown value" do
      s = HalfOpenStruct.new

      expect { s.age }.to raise_error("Unknown key: age")

      s.age = 42
      expect(s.age).to eq 42
    end

    it "raises for unknown methods" do
      s = HalfOpenStruct.new

      expect { s.foo("bar") }.to raise_error(NoMethodError)
    end

    # Considered an API like "s.age?" but that's ambiguous with undefined vs. falsy values.
    it "lets you query for values being defined" do
      s = HalfOpenStruct.new
      expect(s.include?(:age)).to be false

      s.age = 42
      expect(s.include?(:age)).to be true
    end

    it "lets you fetch values with a fallback" do
      s = HalfOpenStruct.new
      expect(s.fetch(:age, :fallback)).to eq :fallback

      s.age = 42
      expect(s.fetch(:age, :fallback)).to eq 42
    end
  end
end

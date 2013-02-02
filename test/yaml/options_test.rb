require "test_helper"

describe YAML::Options do
  describe "load" do
    it "should parse YAML and return YAML::Options" do
      options = YAML::Options.load("---\nkey: value\n")
      options.must_be_instance_of(YAML::Options)
      options.key.must_equal("value")
    end
  end

  describe "_key" do
    it "should be the original Hash#key" do
      options = YAML::Options.new("key" => "value")
      options._key("value").must_equal(:key)
    end
  end

  describe "initialize" do
    it "should convert a hash to YAML::Options" do
      options = YAML::Options.new("key" => "value")
      options.must_respond_to(:key)
      options.key.must_equal("value")
    end

    it "should convert nested hash to nested YAML::Options" do
      options = YAML::Options.new("top" => { "key" => "value" })
      options.must_be_instance_of(YAML::Options)
      options.top.must_be_instance_of(YAML::Options)
      options.top.key.must_equal("value")
    end
  end
end

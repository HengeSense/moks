require File.dirname(__FILE__) + '/../spec_helper'

describe Documenttype do
  it "should be valid" do
    Documenttype.new.should be_valid
  end
end

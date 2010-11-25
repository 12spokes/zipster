require 'spec_helper'

describe "Zipster" do
  
  it "maps 65203 to missouri" do
    Zipster.zip_to_state("65203").should == "MO"
  end
  
  it "maps 01001 to MA" do
    Zipster.zip_to_state("01001").should == "MA"
  end
  
  it "maps 96169 to california" do
    Zipster.zip_to_state("96169").should == "CA"
  end
  
  it "maps 66566 to Kansas" do
    Zipster.zip_to_state("66566").should == "KS"
  end
end
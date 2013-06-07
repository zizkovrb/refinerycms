require "spec_helper"

module Refinery
  class Page
    class Url

      describe Normal do
        describe ".handle?" do
          it "returns true if to_param is present" do
            page = stub(:page, :to_param => "test")
            Normal.handle?(page).should be_true
          end
        end

        describe "#url" do
          it "returns hash" do
            page = stub(:page, :to_param => "test")
            Normal.new(page).url.should eq({
              :controller => "/refinery/pages", :action => "show", :only_path => true,
              :path => nil, :id => "test"
            })
          end
        end
      end

    end
  end
end

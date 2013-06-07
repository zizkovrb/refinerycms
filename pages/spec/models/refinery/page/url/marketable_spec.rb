require "spec_helper"

module Refinery
  class Page
    class Url

      describe Marketable do
        describe ".handle?" do
          it "returns true if marketable_url config is set to true" do
            page = stub(:page)
            Refinery::Pages.stub(:marketable_url).and_return(true)
            Marketable.handle?(page).should be_true
          end
        end

        describe "#url" do
          it "returns hash" do
            page = stub(:page, :nested_url => "test")
            Marketable.new(page).url.should eq({
              :controller => "/refinery/pages", :action => "show", :only_path => true,
              :path => "test", :id => nil
            })
          end
        end
      end

    end
  end
end

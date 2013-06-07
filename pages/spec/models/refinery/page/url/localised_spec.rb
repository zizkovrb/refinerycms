require "spec_helper"

module Refinery
  class Page
    class Url

      describe Localised do
        describe ".handle?" do
          it "returns true if link_url is present" do
            page = stub(:page, :link_url => "/")
            Localised.handle?(page).should be_true
          end
        end

        describe "#url" do
          let(:page) { stub(:page, :link_url => "/test") }

          context "when current frontend locale != default frontend locale" do
            it "returns link_url prefixed with current frontend locale" do
              Refinery::I18n.stub(:current_frontend_locale).and_return(:lv)
              Refinery::I18n.stub(:default_frontend_locale).and_return(:en)
              Localised.new(page).url.should eq("/lv/test")
            end
          end

          context "when current frontend locale == default frontend locale" do
            it "returns unaltered link_url" do
              Refinery::I18n.stub(:current_frontend_locale).and_return(:en)
              Refinery::I18n.stub(:default_frontend_locale).and_return(:en)
              Localised.new(page).url.should eq("/test")
            end
          end
        end
      end

    end
  end
end

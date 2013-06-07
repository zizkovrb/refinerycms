require "spec_helper"

module Refinery
  class Page

    describe Url do
      describe "#url" do
        it "raises NotImplementedError error" do
          expect { Url.new(stub).url }.to raise_error(NotImplementedError)
        end
      end
    end

  end
end

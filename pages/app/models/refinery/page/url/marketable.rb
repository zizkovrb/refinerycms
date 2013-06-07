module Refinery
  class Page
    class Url
      class Marketable < Url

        def self.handle?(page)
          Refinery::Pages.marketable_urls
        end

        def url
          url_hash = base_url_hash.merge(:path => page.nested_url, :id => nil)
          with_locale_param(url_hash)
        end

      end
    end
  end
end

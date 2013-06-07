module Refinery
  class Page
    class Url
      class Normal < Url

        def self.handle?(page)
          page.to_param.present?
        end

        def url
          url_hash = base_url_hash.merge(:path => nil, :id => page.to_param)
          with_locale_param(url_hash)
        end

      end
    end
  end
end

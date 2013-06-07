module Refinery
  class Page
    class Url
      class Localised < Url

        def self.handle?(page)
          page.link_url.present?
        end

        def url
          current_url = page.link_url

          if current_url =~ %r{^/} &&
            Refinery::I18n.current_frontend_locale != Refinery::I18n.default_frontend_locale
            current_url = "/#{Refinery::I18n.current_frontend_locale}#{current_url}"
          end

          current_url
        end

      end
    end
  end
end

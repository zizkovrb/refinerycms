module Refinery
  class Page
    class Url

      def self.build(page)
        # order of array items is important!
        klass = [ Localised, Marketable, Normal ].detect { |d| d.handle?(page) } || self
        klass.new(page).url
      end

      def initialize(page)
        @page = page
      end

      def url
        raise NotImplementedError
      end

      private

      attr_reader :page

      def with_locale_param(url_hash)
        if (locale = Refinery::I18n.current_frontend_locale) != ::I18n.locale
          url_hash.update :locale => locale if locale
        end
        url_hash
      end

      def base_url_hash
        { :controller => '/refinery/pages', :action => 'show', :only_path => true }
      end

    end
  end
end

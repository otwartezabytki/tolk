module Tolk
  class Phrase < ActiveRecord::Base
    has_many :translations, :class_name => 'Tolk::Translation', :dependent => :destroy do
      def primary
        to_a.detect {|t| t.locale_id == Tolk::Locale.primary_locale.id}
      end

      def secondary(locale)
        to_a.detect {|t| t.locale_id == locale.id}
      end
    end

    attr_accessor :translation
  end
end

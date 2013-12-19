require "fontdock"

module ShogiKoma
  class Font
    attr_reader :name
    def initialize(name="IPAMincho")
      set_font(name)
    end

    def set_font(part_of_font_name)
      name = find_font(part_of_font_name)
      @name = name if name
    end

    def find_font(part_of_font_name)
      found = Fontdock::Local.names.find do |name|
        /\A#{part_of_font_name}/i =~ name
      end
      return found if found

      found = Fontdock::Local.names.find do |name|
        /\A#{part_of_font_name}/ =~ name
      end
      return found if found

      found = Fontdock::Local.names.find do |name|
        /#{part_of_font_name}/ =~ name
      end
      return found if found

      Fontdock::Local.names.find do |name|
        /#{part_of_font_name}/i =~ name
      end
    end
  end
end

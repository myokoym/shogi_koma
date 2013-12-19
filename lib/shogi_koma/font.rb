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
      found = find_font_from_pattern(/\A#{part_of_font_name}/i)
      return found if found

      found = find_font_from_pattern(/\A#{part_of_font_name}/)
      return found if found

      found = find_font_from_pattern(/#{part_of_font_name}/)
      return found if found

      find_font_from_pattern(/#{part_of_font_name}/i)
    end

    private
    def find_font_from_pattern(pattern)
      Fontdock::Local.names.find do |name|
        pattern =~ name
      end
    end
  end
end

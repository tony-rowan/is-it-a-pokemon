class NameGeneration
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def generate(min, max)
    name = ""
    char = nil
    until name.length > min && (char.nil? || name.length > max)
      char = generate_from(char)

      next if char.nil?

      name << char
    end

    name
  end

  def generate_from(char)
    generation_data[char].sample
  end

  def generation_data
    @_generation_data ||= begin
      _generation_data = {}

      data.each do |datum|
        previous_char = nil

        (datum.chars + [nil]).each do |char|
          _generation_data[previous_char] = [] unless _generation_data[previous_char]
          _generation_data[previous_char] << char

          previous_char = char
        end
      end

      _generation_data
    end
  end
end

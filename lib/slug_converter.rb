require "slug_converter/version"
require 'set'
require 'gem_config'

class SlugConverter

  include GemConfig::Base

  with_configuration do
    has :alphabet, default: "qjeghxtrpnfmdzwvsybkuoca"
  end

  def initialize(number_or_slug)
     @alphabet = SlugConverter.configuration.alphabet.split(//)
    if number_or_slug.to_i != 0
      @number = number_or_slug.to_i
    elsif validate_string(number_or_slug)
      @slug = number_or_slug.downcase
    else
      raise ArgumentError, 'Argument must be integer value or non-empty string consisting of predefined letters'
    end
  end

  def number
    if @number.nil?
      @number = bijective_decode
    else
      @number
    end
  end

  def number=(new_number)
    @number = new_number
    @slug = bijective_encode
    @number
  end

  def slug
    if @slug.nil?
      @slug = bijective_encode
    else
      @slug
    end
  end

  def slug=(new_slug)
    @slug = new_slug
    @number = bijective_decode
    @slug
  end

  private

    def bijective_encode
      id = @number
      return @alphabet[0] if id == 0
      s = ''
      base = @alphabet.length
      while id > 0
        s << @alphabet[id.modulo(base)]
        id /= base
      end
      s.reverse
    end

    def bijective_decode
      i = 0
      base = @alphabet.length
      @slug.each_char { |c| i = i * base + @alphabet.index(c) }
      i
    end

    def validate_string(slug)
      unless slug.nil?
        alphabet = Set.new @alphabet
        slug_letters = Set.new slug.downcase().split(//)
        slug != "" && (slug_letters.subset? alphabet)
      end
    end

end

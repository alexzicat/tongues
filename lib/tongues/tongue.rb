class Tongue
  attr_reader :lang_symbol, :language, :confidence

  def initialize(lang_symbol, language, confidence)
    @lang_symbol = lang_symbol
    @language = language
    @confidence = confidence
  end
end
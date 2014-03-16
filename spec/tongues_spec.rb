require 'spec_helper'

describe Tongues do
  before do
    Tongues::Configuration.api_key= 'demo'
    VCR.insert_cassette('tongues')
  end

  after do
    VCR.eject_cassette
  end

  describe 'language detection on a String' do
    it 'returns a language (english)' do
      'this is an english text'.tongue.should == 'ENGLISH'
    end

    it 'returns a language (french)' do
      'ceci est un texte en français'.tongue.should == 'FRENCH'
    end

    it 'returns a language (spanish)' do
      'este es un texto español'.tongue.should == 'SPANISH'
    end

    it 'returns a language (russian)' do
      'это является русский текст'.tongue.should == 'RUSSIAN'
    end

    it 'returns a language code (english)' do
      'this is an english text'.tongue_code.should == 'en'
    end

    it 'returns a language code (french)' do
      'ceci est un texte en français'.tongue_code.should == 'fr'
    end

    it 'returns a language code (spanish)' do
      'este es un texto español'.tongue_code.should == 'es'
    end

    it 'returns a language code (russian)' do
      'это является русский текст'.tongue_code.should == 'ru'
    end

    it 'returns the confidence in the detection (english)' do
      'this is an english text'.tongue_confidence.should == 21.33
    end

    it 'returns the confidence in the detection (french)' do
      'ceci est un texte en français'.tongue_confidence.should == 9.24
    end

    it 'returns the confidence in the detection (spanish)' do
      'este es un texto español'.tongue_confidence.should == 19.29
    end

    it 'returns the confidence in the detection (russian)' do
      'это является русский текст'.tongue_confidence.should == 12.69
    end

    it 'returns nil for a text of unknown language' do
      '1234'.tongue.should == nil
    end
  end

  describe 'language detection on a Symbol' do
    it 'returns a language (english)' do
      :'this is an english text'.tongue.should == 'ENGLISH'
    end

    it 'returns a language (french)' do
      :'ceci est un texte en français'.tongue.should == 'FRENCH'
    end

    it 'returns a language (spanish)' do
      :'este es un texto español'.tongue.should == 'SPANISH'
    end

    it 'returns a language (russian)' do
      :'это является русский текст'.tongue.should == 'RUSSIAN'
    end

    it 'returns a language code (english)' do
      :'this is an english text'.tongue_code.should == 'en'
    end

    it 'returns a language code (french)' do
      :'ceci est un texte en français'.tongue_code.should == 'fr'
    end

    it 'returns a language code (spanish)' do
      :'este es un texto español'.tongue_code.should == 'es'
    end

    it 'returns a language code (russian)' do
      :'это является русский текст'.tongue_code.should == 'ru'
    end

    it 'returns the confidence in the detection (english)' do
      :'this is an english text'.tongue_confidence.should == 21.33
    end

    it 'returns the confidence in the detection (french)' do
      :'ceci est un texte en français'.tongue_confidence.should == 9.24
    end

    it 'returns the confidence in the detection (spanish)' do
      :'este es un texto español'.tongue_confidence.should == 19.29
    end

    it 'returns the confidence in the detection (russian)' do
      :'это является русский текст'.tongue_confidence.should == 12.69
    end

    it 'returns nil for a text of unknown language' do
      :'1234'.tongue.should == nil
    end
  end
end
require_relative '../../lib/syfyfancam/url'

RSpec.describe Syfyfancam::URL do
  context 'valid URL' do
    let(:url) { 'http://www.syfyfancam.com/videos/ojt1nd5bnbog/' }
    let(:html) do
      <<-EOS
      <html><head><title></title>
      <meta property="og:image" content="http://d1fmy74dfqc2hp.cf.net/resources/footage/vE/oJt1Nd5BnboG/024.jpg" />
      </head><body></body></html>
      EOS
    end

    subject(:syfyfancam) { described_class.new(url) }

    before do
      allow(Net::HTTP).to receive(:get).with(URI.parse(url)).and_return(html)
    end

    describe '#images' do
      it 'returns an array of 100 URLs' do
        allow(syfyfancam).to receive(:base_url).and_return('http://a.com/')

        images = syfyfancam.images

        expect(images.size).to eq(100)
        expect(images[0]).to eq('http://a.com/001.jpg')
        expect(images[1]).to eq('http://a.com/002.jpg')
        expect(images[35]).to eq('http://a.com/036.jpg')
        expect(images[99]).to eq('http://a.com/100.jpg')
      end
    end
  end

  context 'Wrong URL' do
    let(:url) { 'http://www.nintendo.co.jp/' }

    describe '#initialize' do
      it 'fails to create an instance' do
        expect { described_class.new(url) }.to raise_error(ArgumentError, Syfyfancam::ERROR_URL)
      end
    end
  end

  context 'Not valid URL' do
    let(:url) { '|cat /etc/passwd' }

    describe '#initialize' do
      it 'fails to create an instance' do
        expect { described_class.new(url) }.to raise_error(URI::InvalidURIError, Syfyfancam::ERROR_URL)
      end
    end
  end
end

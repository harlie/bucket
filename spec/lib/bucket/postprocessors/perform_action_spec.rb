require 'rails_helper'

describe Bucket::Postprocessors::PerformAction do
  let(:processor) { described_class.new }

  describe '#process' do
    let(:message_response) { MessageResponse.new(text: 'text', verb: action) }

    context "verb is '<action>'" do
      let(:action) { '<action>' }

      it 'formats the response text' do
        processor.process(message_response)

        expect(message_response.text).to eq '_text_'
      end

      it 'returns nil' do
        expect(processor.process(message_response)).to eq nil
      end
    end

    context "verb is not '<action>'" do
      let(:action) { nil }

      it 'does not format the response text' do
        expect do
          processor.process(message_response)
        end.not_to change {
          message_response.text
        }
      end
    end
  end
end
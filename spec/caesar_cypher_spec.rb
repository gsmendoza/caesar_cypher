require 'spec_helper'
require 'caesar_cypher'

RSpec.describe CaesarCypher do
  describe '.encrypt_character' do
    let(:orientation) { :forward }
    let(:shift_value) { 0 }

    context 'when the unencrypted_character is an empty string' do
      let(:unencrypted_character) { '' }

      it 'returns itself' do
        expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:)).to eq('')
      end
    end

    context 'when the unencrypted_character is a blank space' do
      let(:unencrypted_character) { ' ' }

      it 'returns itself' do
        expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:)).to eq(' ')
      end
    end

    context 'when the character is a lowercase alphabet character' do
      let(:unencrypted_character) { 'a' }

      context 'when the orientation is forward' do
        let(:orientation) { :forward }

        context 'when the shift value is 0' do
          let(:shift_value) { 0 }

          it 'returns itself' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('a')
          end
        end

        context 'when the shift value will shift the character to a letter before and including z' do
          let(:shift_value) { 1 }

          it 'returns the shifted version of the character' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('b')
          end
        end

        context 'when the shift value will shift the character to a character after z' do
          let(:unencrypted_character) { 'z' }
          let(:shift_value) { 1 }

          it 'returns the shifted version of the character' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('a')
          end
        end
      end

      context 'when the orientation is backward' do
        let(:orientation) { :backward }

        context 'when the shift value is 0' do
          let(:shift_value) { 0 }

          it 'returns itself' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('a')
          end
        end

        context 'when the shift value will shift the character to a letter after and including a' do
          let(:unencrypted_character) { 'z' }
          let(:shift_value) { 1 }

          it 'returns the shifted version of the character' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('y')
          end
        end

        context 'when the shift value will shift the character to a character before z' do
          let(:unencrypted_character) { 'a' }
          let(:shift_value) { 1 }

          it 'returns the shifted version of the character' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('z')
          end
        end
      end
    end

    context 'when the character is a uppercase alphabet character' do
      let(:unencrypted_character) { 'A' }

      context 'when the orientation is forward' do
        let(:orientation) { :forward }

        context 'when the shift value is 0' do
          let(:shift_value) { 0 }

          it 'returns itself' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('A')
          end
        end

        context 'when the shift value will shift the character to a letter before and including z' do
          let(:shift_value) { 1 }

          it 'returns the shifted version of the character' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('B')
          end
        end

        context 'when the shift value will shift the character to a character after z' do
          let(:unencrypted_character) { 'Z' }
          let(:shift_value) { 1 }

          it 'returns the shifted version of the character' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('A')
          end
        end
      end

      context 'when the orientation is backward' do
        let(:orientation) { :backward }

        context 'when the shift value is 0' do
          let(:shift_value) { 0 }

          it 'returns itself' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('A')
          end
        end

        context 'when the shift value will shift the character to a letter after and including a' do
          let(:unencrypted_character) { 'Z' }
          let(:shift_value) { 1 }

          it 'returns the shifted version of the character' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('Y')
          end
        end

        context 'when the shift value will shift the character to a character before z' do
          let(:unencrypted_character) { 'A' }
          let(:shift_value) { 1 }

          it 'returns the shifted version of the character' do
            expect(described_class.encrypt_character(unencrypted_character, orientation:, shift_value:))
              .to eq('Z')
          end
        end
      end
    end
  end

  describe 'encrypt_string' do
    it 'encrypts the string using Caesar cypher' do
      expect(described_class.encrypt('az AZ', orientation: :forward, shift_value: 1)).to eq('ba BA')
    end
  end
end

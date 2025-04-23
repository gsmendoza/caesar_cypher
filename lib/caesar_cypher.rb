# frozen_string_literal: true

require_relative "caesar_cypher/version"

module CaesarCypher
  class Error < StandardError; end

  LOWERCASE_A_BYTE = 'a'.bytes.first
  UPPERCASE_A_BYTE = 'A'.bytes.first

  ALPHABET_SIZE = 26

  def self.encrypt(unencrypted_string, orientation:, shift_value:)
    result_chars = unencrypted_string.chars.map do |char|
      encrypt_character(char, orientation:, shift_value:)
    end

    result_chars.join
  end

  def self.encrypt_character(unencrypted_character, orientation:, shift_value:)
    return unencrypted_character if unencrypted_character.strip.empty?

    alphabet_range_start = ('a'..'z').include?(unencrypted_character) ? LOWERCASE_A_BYTE : UPPERCASE_A_BYTE

    first_byte = unencrypted_character.bytes.first

    orientation_multiplier = orientation == :forward ? 1 : -1
    shifted_byte = ((first_byte - alphabet_range_start) + shift_value*orientation_multiplier) % ALPHABET_SIZE + alphabet_range_start

    result = String.new(unencrypted_character)
    result.setbyte(0, shifted_byte)
    result
  end
end

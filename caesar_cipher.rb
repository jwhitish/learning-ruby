#take a string and a key
#shift string by key numbers
#return shifted string
#wrap from z-a
#keep case instact

#chars splits string into array of characters
#map transforms the array to a new array of ascii values corresponding to the characters
#shifted adds the key value to the ascii value
#use map the ascii values to their characters and join the elements back into a string

def caesar_cipher(string, key = 0)
  ascii = string.chars.map(&:ord)
  shifted = ascii.map do |c|
    if c == 32
      c = 32
    else
      if (c + key.to_i) < 123
        c + key.to_i
      else
        (c + key.to_i) - 26
      end
    end
  end
  shifted_char = shifted.map {|c| c.chr }.join
  puts shifted_char
end

def decrypt(string, key = 0)
  ascii = string.chars.map(&:ord)
  shifted = ascii.map do |c|
    if c == 32
      c = 32
    else
      if (c - key.to_i) > 96
        c - key.to_i
      else
        (c - key.to_i) + 26
      end
    end
  end
  shifted_char = shifted.map {|c| c.chr}.join
  puts shifted_char
end

caesar_cipher("zoo and", 5)
#decrypt("ett", 5)

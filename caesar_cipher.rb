#take a string and a key [done]
#shift string by key numbers [done]
#return shifted string [done]
#wrap from z-a [done]
#keep case instact

#chars splits string into array of characters
#map transforms the array to a new array of ascii values corresponding to the characters
#shifted adds the key value to the ascii value
#use map the ascii values to their characters and join the elements back into a string

class Cipher

  def caesar_cipher(string, key = 0)
    ascii = string.downcase.chars.map(&:ord)
    shifted = ascii.map do |c|
      if c == 32 #check if space
        c = 32
      else
        if (c + key.to_i) < 123 #check if < lowercase z
          c + key.to_i
        else
          (c + key.to_i) - 26 #wraps to beg
        end
      end
    end
    shifted_char = shifted.map {|c| c.chr }.join
    puts shifted_char
  end

  def decrypt(string, key = 0)
    ascii = string.downcase.chars.map(&:ord)
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

end

mycipher = Cipher.new
mycipher.caesar_cipher("Zoo and", 5)
mycipher.decrypt("ett fsi", 5)

def sub_string(str, dict)
  string_array = str.split(' ')

    new_hash = dict.reduce({}) do |hash, word|
      string_array.each do |string|
        if string.downcase.include?(word)
          if hash.has_key?(word)
            hash[word] += 1
          else
            hash[word] = 1
          end
        end
      end
      hash
  end
  p new_hash
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

sub_string("Howdy partner, sit down! How's it going?", dictionary)
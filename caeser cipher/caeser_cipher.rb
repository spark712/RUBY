def caesar_cipher(string, drift)
    string_arr = string.split('')
    if drift == 0
        p string
    else
        cipher(string_arr, drift)
    end
end

def cipher(string_arr, drift)    
    ciphered_array = string_arr.map do |character|
        if character == ' '
            character = character
        else
            code = character.ord
                
            if code.between?(97, 122)
                if code + drift > 122
                    code = (code + drift) - 26
                elsif code + drift < 97
                    code = (code + drift) + 26
                else
                    code = code + drift 
                end
            elsif code.between?(65, 90)   
                if code + drift > 90
                    code = (code + drift) - 26
                elsif code + drift < 65
                    code = (code + drift) + 26 
                else
                    code = code + drift 
                end
            else
                    character = code.chr
            end
            character = code.chr
        end
    end
    p ciphered_array.join('')
end

caesar_cipher("What a string!", 5)
caesar_cipher("What a string!", -5)
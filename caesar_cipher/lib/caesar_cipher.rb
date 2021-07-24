def char_to_ascii(char)
    char.ord
end
def convert(str, key)
    i = 0
    new_str = []
    while i < str.size do
        new_str[i] = str[i]
        i += 1
    end
    new_str.map! do |str|
        if (str + key >= 97 && str + key <= 122 && str != 32)
            str += key
        elsif (str == 32)
            str
        elsif (str + key >= 65 && str + key <= 90 && str != 32)
            str += key
        elsif (str >= 65 && str <= 90 && str + key > 90)
            remainder = (str + key) % 90
            if remainder >= 26
                extra = remainder % 26
                str = 65 + extra
            else
                str = 64 + remainder
            end
        elsif ( str >= 97 && str <= 122 && str + key > 122)
            remainder = (str + key) % 122
            if remainder >= 26
                extra = remainder % 26
                str = 97 + extra
            else
                str = 96 + remainder
            end
        end
    end
    return new_str
end

def ascii_to_char(ascii)
    (ascii).chr
end

def caesar_cipher(string, key)
    new_str = string.chars.map! {|char| char_to_ascii(char)}
    converted_string = convert(new_str, key)
    converted_string
    string_coded = converted_string.map { |ascii| ascii_to_char(ascii)}
    string_coded.join("")
end
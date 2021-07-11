dictionary = []
def sub_strings(my_words, dictionary)
    words = Array.new()
    my_words.split.each do |word|
        words << word
    end
    my_hash = Hash.new(0)
    dictionary.each do |word|
        if words.include?(word)
            my_hash[word] += 1
        else
            next
        end
    end
    puts my_hash
end
sub_strings("", dictionary)
def stock_picker(array)
    results = Hash.new(0)
    array.each_with_index do |number_a, i_a|
        array.each_with_index do |number_b, i_b|
            if i_a >= i_b
                next
            else
                result = number_b - number_a
                results[result] = i_a, i_b
            end
        end
    end
    max_result = results.max
    p max_result[1]
end
stock_picker([])
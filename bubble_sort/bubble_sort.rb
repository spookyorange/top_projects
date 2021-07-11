def bubble_sort(array)
    n = 0
    while (n != (array.length - 1))
        array.each_with_index do |value, index|
            if (index == 0)
                next
            elsif
                array[index - 1] > array[index]
                a = array[index - 1]
                b = array[index]
                array[index] = a
                array[index - 1] = b
            else
                next
            end
        end
        n += 1
    end
    p array
end

bubble_sort([...])
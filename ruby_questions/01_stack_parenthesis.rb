# input: string, paren hash from opening paren to closing paren
# output: boolean which determines if the string contains balanced parentheses

# "lololol(e3)lol" => True 
# ")(" => False

# "[fdasf]fdsa(f)af{}" => True
# "[(])"   => False
# "[({})]" => True
# "[({})]  []" => True
# "[(])"
# parens: hash{'(' => ')', '[' => ']', '{' => '}'}


def paren_pair(str, hash)
    open_parens = []
    close_parens = hash.values
    str.each_char do |paren|
        if hash[paren]
            open_parens << paren
        else
           # if the value of the last open paren is the current paren
           if close_parens.include?(paren)
               if hash[open_parens[open_parens.length - 1]] == paren 
                   open_parens.pop()
               else
                   return false
               end
           # then move on to the next element
           end
        end
     end
    open_parens.empty?
end
test_hash = { '(' => ')', '[' => ']', '{' => '}'}
puts "Given a string with parentheses, output a boolean determining if the parentheses are closed correctly"
puts "*" * 10
puts paren_pair("[fdasf]fdsa(f)af{}", test_hash) == true
puts paren_pair("[(])", test_hash) == false
puts paren_pair("[({})]", test_hash) == true
puts paren_pair("[(])", test_hash) == false
puts paren_pair("(", test_hash) == false
puts "*" * 10





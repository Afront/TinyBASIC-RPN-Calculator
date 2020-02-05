def calculate_rpn_automata input
	stack = []
	ops = ['+','-','/','*','%']

	input.split.each do |i|
		stack << ((ops.include? i) ? stack.pop.send(i, stack.pop.to_f) : i.to_f)
	end
	stack.pop # or stack[0]
end

p calculate_rpn_automata "1 2 +" # gets.chomp
p calculate_rpn_automata "1 2 + 3 + 4 + 5 +"
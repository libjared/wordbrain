#!/usr/bin/env ruby

require 'set'

chars = 'depict'
chars_array = chars.split('')

dict = File.readlines('/usr/share/dict/american-english-huge', chomp: true)
perms_by_length = (3..chars.length).map do |perm_length|
	chars_array.permutation(perm_length).map(&:join).uniq
end
perms_all = perms_by_length.flatten
perms_set = perms_all.to_set
dict_set = dict.to_set

result = perms_set & dict_set
final_result = result.to_a.sort_by do |a|
	[-a.length, a]
end

puts final_result

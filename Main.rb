def ipv4_address_no_regex?(str)
  blocks = str.split(".")
  return false unless blocks.size == 4
  return false unless blocks.all? { |block| block.size <=3 }
  return false unless blocks.all? { |block| block.match? /^\d+$/ }
  return false unless blocks.all? { |block| block.to_i.between?(0, 255)}
  blocks.each do |block|
    return false if block.size == 3 and block[0].to_i == 0
    return false if block.size == 2 and block[0].to_i == 0
  end
  true
end

def ipv4_address?(str)
  block = /\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5]/
  str.match? /\A#{block}\.#{block}\.#{block}\.#{block}\z/
end

puts "Hello IPv4 Address validation"
str = "0.12.2.01"
puts "#{str} validation is: #{ipv4_address?(str)}"
puts "#{str} validation(method without regex) is: #{ipv4_address_no_regex?(str)}"

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
puts "Hello IPv4 Address validation"
str = "12.222.3.10"
puts "Result of method without regex: #{ipv4_address_no_regex?(str)}"

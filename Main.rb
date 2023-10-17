# Method to validate IPv4 with only one small regular expression
def ipv4_address_one_regex?(str)
  blocks = str.split(".")
  return false unless blocks.size == 4 # check if IPv4 contains 4 "blocks" of numbers
  return false unless blocks.all? { |block| block.size <=3 } # check the size of blocks
  return false unless blocks.all? { |block| block.match? /^\d+$/ } # regular expression which check if string contains only numbers
  return false unless blocks.all? { |block| block.to_i.between?(0, 255)} # check the range of numbers
  # section below check if some block contains leading zeroes
  blocks.each do |block|
    return false if block.size == 3 and block[0].to_i == 0
    return false if block.size == 2 and block[0].to_i == 0
  end
  true
end

def ipv4_address?(str)
  # regular expression which check if string is IPv4 canonical representation
  block = /\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5]/
  str.match? /\A#{block}\.#{block}\.#{block}\.#{block}\z/
end

if ARGV.empty?
  puts "Sorry, the input is empty."
else
  puts "#{ARGV[0]} IPv4 validation is: #{ipv4_address?(ARGV[0])}"
  puts "#{ARGV[0]} IPv4 validation(method with one regex) is: #{ipv4_address_one_regex?(ARGV[0])}"
end
puts "P.S. The program takes only the first input from console."

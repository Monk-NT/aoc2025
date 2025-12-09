class IdChecker

  def initialize(id_range)
    @id_range = id_range
  end

  def check
    if @id_range.respond_to?("split")
      id_parts = @id_range.split("-")
      calc = 0
      if id_parts[0][0] != "0" and id_parts[1][0] != "0"
        [*id_parts[0].to_i..id_parts[1].to_i].each do |curr_id|
          calc += check_repeating_id(curr_id)
        end
      end
    end
    return calc
  end

  def check_id(id)
    if id.respond_to?("to_s")
      id_str = id.to_s
      if id_str[0,id_str.length / 2] == id_str[id_str.length / 2 ..]
        return id_str.to_i
      end
    end
    return 0
  end

  def check_repeating_id(id)
    if id.respond_to?("to_s")
      id_str = id.to_s
      repeating_pattern = /^(\d+)\1+$/
      if id_str.match(repeating_pattern) 
        return id_str.to_i
      end
      return 0
    end
  end
end

if __FILE__ == $0

  IO.foreach(ARGV[0]) do |line|
    calc = 0
    line.split(",") do |id|
      checker = IdChecker.new(id)
      calc += checker.check
    end
    puts "Final calc: #{calc}"
  end 
end

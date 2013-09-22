module ApplicationHelper

  def category_parser(string)
    string.gsub(/[\s\&\/\-]/,' '=>'%20','&'=>'%26','/'=>'%2F','-'=>'%2D')
  end

  def mile_calculator(price)
  	price*13 + rand(500)
  end
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> alejandro

  def nested_hash_finder(obj,key)
    results = []
    if obj.respond_to?(:key?) && obj.key?(key)
      results << obj[key]
    elsif obj.respond_to?(:each)
      r = nil
      obj.find{ |*a| r=nested_hash_finder(a.last,key) }
      r
    end
    return results
  end



<<<<<<< HEAD
>>>>>>> alejandro
=======
=======
>>>>>>> f33a2d31d5197243a0577168490452cd585e51d0
>>>>>>> alejandro
end

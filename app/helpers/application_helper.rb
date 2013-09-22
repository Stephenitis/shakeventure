module ApplicationHelper

  def category_parser(string)
     string.gsub(/[\s\&\/\-]/,' '=>'%20','&'=>'%26','/'=>'%2F','-'=>'%2D')
  end


  def nested_hash_finder(obj,key)
    results = []
    if obj.respond_to?(:key?) && obj.key?(key)
       obj[key]
    elsif obj.respond_to?(:each)
      r = nil
      obj.find{ |*a| r=nested_hash_finder(a.last,key) }
      r
    end
  end



end

module ApplicationHelper

  def category_parser(string)
    string.gsub(/[\s\&\/\-]/,' '=>'%20','&'=>'%26','/'=>'%2F','-'=>'%2D')
  end

  def mile_calculator(price)
  	price*13 + rand(500)
  end

end

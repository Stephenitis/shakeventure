module ApplicationHelper

  def category_parser(string)
    string.gsub(/[\s\&\/\-]/,' '=>'%20','&'=>'%26','/'=>'%2F','-'=>'%2D')
  end

end

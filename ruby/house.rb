class House
  DATA = 
    [ 'the horse and the hound and the horn that belonged to',
      'the farmer sowing his corn that kept',
      'the rooster that crowed in the morn that woke',
      'the priest all shaven and shorn that married',
      'the man all tattered and torn that kissed',
      'the maiden all forlorn that milked',
      'the cow with the crumpled horn that tossed',
      'the dog that worried',
      'the cat that killed',
      'the rat that ate',
      'the malt that lay in',
      'the house that Jack built' ] 

  def recite
    (1..data.size).map {|i| line(i)}.join("\n")
  end
  
  def line(number)
    "This is #{phrase(number)}.\n"
  end

  def phrase(number)
    format(order(DATA).last(number)).join(" ")
  end

  private

  # House is an orderer
  def order(data)
    data
  end

  # House is a formatter
  def format(parts)
    parts
  end
end

module EchoFormatter
  def format(parts)
    parts.zip(parts).flatten
  end
end

module RandomOrder
  def order(data)
    data.shuffle
  end
end

class EchoHouse < House
  include EchoFormatter
end

class RandomHouse < House
  include RandomOrder
end

class RandomEchoHouse < House
  include RandomOrder
  include EchoFormatter
end


puts House.new.line(3) # House

puts House.new.extend(RandomOrder).line(3) # RandomHouse
puts House.new.extend(EchoFormatter).line(3) # EchoHouse
puts House.new.extend(RandomOrder).extend(EchoFormatter).line(3) # RandomEchoHouse

puts RandomHouse.new.line(3)
puts EchoHouse.new.line(3)
puts RandomEchoHouse.new.line(3)

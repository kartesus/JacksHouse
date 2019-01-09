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

  attr_reader :data, :formatter

  def initialize(orderer: DefaultOrder.new, formatter: DefaultFormatter.new)
    @data = orderer.order(DATA)
    @formatter = formatter
  end

  def recite
    (1..data.size).map {|i| line(i)}.join("\n")
  end
  
  def line(number)
    "This is #{phrase(number)}.\n"
  end

  def phrase(number)
    parts(number).join(" ")
  end

  def parts(number)
    formatter.format(data.last(number))
  end
end

class DefaultOrder
  def order(data)
    data
  end
end

class DefaultFormatter
  def format(parts)
    parts
  end
end

class EchoFormatter
  def format(parts)
    parts.zip(parts).flatten
  end
end

class RandomOrder
  def order(data)
    data.shuffle
  end
end


puts House.new.line(3) # House
puts House.new(orderer: RandomOrder.new).line(3) # RandomHouse
puts House.new(formatter: EchoFormatter.new).line(3) # EchoHouse
puts House.new(orderer: RandomOrder.new, formatter: EchoFormatter.new).line(3) # RandomEchoHouse

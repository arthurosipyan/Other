=begin
Exercise 1
Reimplement arraySum using a block

def arraySum(anArray)
  return 0 if anArray==[]
  return anArray[0] + arraySum(anArray[1..-1])
end

puts arraySum([3,4,1,2,5])
=end

def arraySum anArray
  sum = 0
  anArray.each{|x| sum += x}
  return sum
end

puts arraySum([3,4,1,2,5])

=begin
Exercise 2
Create a Date class with a mutator and accessor for three
integers corresponding to a year, month, and day.
Create an Investment class with mutators and accessors for a Date
and a string representing a name.
Use inheritance to create two new classes which are derived from
the Investment class: A Cash class, which has a mutator for setting a value
member directly and a constructor which sets the investment name to “Cash”
A Stock class, which has mutattors for amount and share value members
Both should have value methods which return the overall value of the investment.

Create several instances of both types of investments
and use them to populate a list.
=end

class Date
  def set(year,month,day)
    @year = year
    @month = month
    @day = day
  end
  def get
      [@year,@month,@day]
  end
  def to_s
    get
  end
end

class Investment
    def setDate date
      @date = date
    end
    def setName name
      @name = name
    end
    def getDate
      @date
    end
    def getName
      @name
    end
    def to_s
      [getName,value,getDate.to_s]
end

class Cash < Investment
  def setValue value
    @value = value
  end
  def value
    @value
  end
  def initialize
    @name = Cash
  end
  def to_s
    super.s
end

class Stock < Investment
  def setSharePrice
    @sharePrice = price
  end
  def setAmount
    @amount = amount
  end
  def value
    @sharePrice * @amount
  end
end

appleStock = Stock.new
appleStock.setName "APPL"
appleStock.setSharePrice
appleStock.setAmount
investmentDate = Date.new
investmentDate.set(2014, 5, 31)
appleStock.setDate(investmentDate)

ibmStock = Stock.new
ibmStock.setName "IBM"
ibmStock.setSharePrice 30
ibmStock.setAmount = 10
investmentDate = Date.new
investmentDate.set(2014, 5, 31)
ibmStock.setDate(investmentDate)

googleStock = Stock.new
googleStock.setName 'GoogleStock'
googleStock.setSharePrice 30
googleStock.setAmount 10
googleStock = Date.new
investmentDate.set(2014, 5, 31)
googleStock.setDate(investmentDate)

myCash = Cash.new
myCash.setValue 300
investmentDate = Date.new
investmentDate.set(2014, 5, 31)
myCash.setDate(investmentDate)


fbStock = Stock.new
fbStock.setName 'FaceBook'
fbStock.setSharePrice 30
fbStock.setAmount 10
investmentDate = Date.new
investmentDate.set(2014, 5, 31)
fbStock.setDate(investmentDate)

investmentArray = [appleStock,googleStock,ibmStock,fbStock,myCash]

puts investmentArray

def aboveValue (iArray,threshold)
  return [] if iArray==[]
  if iArray[0].value >= threshold
    return [iArray[0]] + aboveValue(iArray[1..-1],threshold)
  else
    return aboveValue(iArray[1..-1],threshold)
  end
end

puts "aboveValue test:"
puts aboveValue(investmentArray,200)

puts "Hello World"

class B
    def m1
        4
    end
    def m3 x
            x.abs * 2 + self.m1
    end
end

b = B.new
puts b.m3 15

class A
    def m1
        @foo = 0
    end
    def m2 x
            @foo += x
    end
    def getFoo
            @foo
    end
end

x = A.new
y = A.new
z = x
puts x.getFoo
z.m1
puts x.getFoo
z.m2 3
puts x.getFoo
y.m1
y.m2 4
puts y.getFoo
puts x.getFoo

class HelloWorld
  def Howdy s
      puts "Hello #{s}!"
  end
end

#HelloWorld hello = new HelloWorld();
hello = HelloWorld.new
hello.Howdy "Class"

def fact(n)
    if n == 0
          1
    else
       n*fact(n-1)
    end
end

def fact2(n)
    1 if n == 0
    n*fact2(n-1)
end

puts fact 5
puts fact2 5
#puts fact ARGV[0].to_i

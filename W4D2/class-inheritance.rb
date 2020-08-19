class Employee
    #returns name, title, salary and boss
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multi)
        bonus = (self.salary) * multi

    end
end


class Manager < Employee
    
    attr_accessor :employees

    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus(multi)
        total = 0
        self.employees.each { |emp| total += emp.salary  }
        bonus = total * multi
    end
end

fred = Manager.new("Fred","not_the_coffe_boy", 10000, nil)
emp_1 = Employee.new("fred","coffee_boy", 10000, fred)
emp_2 = Employee.new("tom","coffee_boy", 10000, fred)

fred.employees << emp_1
fred.employees << emp_2

p fred.bonus(0.002)
p emp_1.bonus(0.002)

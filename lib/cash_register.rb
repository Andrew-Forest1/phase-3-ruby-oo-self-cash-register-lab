require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :prices, :quantity

    def initialize(discount = 0)
        @discount=discount
        @total = 0.0
        @items = []
        @prices = []
        @quantity = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity 
        @quantity << quantity
        count = 0
        until count == quantity do
            @items << title
            @prices << price
            count += 1
        end
    end

    def apply_discount
        @total = @total * (1.0 - @discount / 100.0)
        if discount == 0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        if(@items.length != 0)
            count = 0
            stop = @quantity.pop
            until count == stop
                @items.pop
                @total -= prices.pop
                count += 1
            end
        else
            @total = 0.0
        end
    end

end 

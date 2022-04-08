module OwnedStocksHelper
    def number_to_currency_p(number)
        number_to_currency(number, unit: "$ ")
    end
end

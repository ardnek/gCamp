class PagesController < ApplicationController
    def index
@quotes = []

    quote1 = Quote.new
    quote1.text = '"Enlightenment is the unprogrammed state."'
    quote1.author = "-Jed McKenna"

    quote2 = Quote.new
    quote2.text = '"You\'ve baked a really lovely cake, but then you\'ve used dog shit for frosting."'
    quote2.author = "-Steve Jobs"

    quote3 = Quote.new
    quote3.text = '"Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live."'
    quote3.author = "-John Woods"

    @quotes = [quote1, quote2, quote3]

    end
end

class PagesController < ApplicationController
    def index

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

    def faq

          question1 = Question.new
          question1.question = "What is gCamp?"
          question1.answer = "gCamp is an awesome tool that is going to change your life. gCamp is your one stop shop to organize all your tasks and documents. You'll also be able to track comments that you and others make. gCamp may eventually replace all need for paper and pens in the entire world. Well, maybe not, but it's going to be pretty cool."

          question2 = Question.new
          question2.question = "How do I join gCamp?"
          question2.answer = "Right now, gCamp is still in production. So there is not a sign up page open to the public yet! Your best option is to become super best friends with a gCamp developer. They can be found in the hanging around gSchool during the day and hitting the hottest clubs at night."

          question3 = Question.new
          question3.question = "When will gCamp be finished?"
          question3.answer = "gCamp is a work in progress. That being said, it should be fully functional by December 2014. Functional, but our developers are going to continue to improve the site for the forseeable future. Check in daily for new features and awesome functionality. It's going to blow your mind. Organization is only (well, will only) be a click away. Amazing!"

          @questions = [question1, question2, question3]
  end
end

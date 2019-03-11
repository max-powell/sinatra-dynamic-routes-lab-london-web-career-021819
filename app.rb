require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    @number = params[:number]
    "#{@number.to_i ** 2}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    @phrase * @number
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    params.values.join(' ') + '.'
  end

  get '/:operation/:number1/:number2' do
    operators = {'add' => '+', 'subtract' => '-', 'multiply' => '*', 'divide' => '/'}
    @operator = params[:operation]
    @number1 = params[:number1].to_i
    @number2 = params[:number2].to_i

    answer = eval("#{@number1} #{operators[@operator]} #{@number2}").to_s
  end
end

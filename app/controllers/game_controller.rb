class GameController  < ApplicationController

  def try
    @number = cookies[:number].to_i
    if @number.nil?
       @number = rand(99) +1
    end
    params[:guess]
    @result = "Guess the number"
      if params[:guess].to_i > @number
        @result = "Too high, Guess again"
        cookies[:try] = cookies[:try].to_i + 1
        @attempt = cookies[:try]
      else
      if params[:guess].to_i < @number
        @result = "Too Low, Guess again"
        cookies[:try] = cookies[:try].to_i + 1
        @attempt = cookies[:try]
      end
      if params[:guess].to_i == @number
        @result = "You have guessed correct number. New game begins."
         @number = rand(99) +1
          cookies[:try] = 0
      end
    end


    cookies[:number]= @number

    render "try.html.erb"
  end

  # def reset
  #   @number = nil
  #   cookies[:try] = 0
  #   @attempt = 0
  #   render "try.html.erb"
  # end
end

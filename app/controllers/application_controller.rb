class ApplicationController < ActionController::Base
  
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calculate_random

    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @random = rand(@lower..@upper)
    render({ :template => "calculation_templates/random_results.html.erb"})
  end

  def blank_root_form
    render({ :template => "calculation_templates/root_form.html.erb"})
  end

  def calculate_root
    @user_root = params.fetch("user_root").to_f
    @root_result = @user_root ** (0.5)
    render({ :template => "calculation_templates/root_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("user_apr").to_f / 100
    @mpr = @apr / 12
    
    @noy = params.fetch("user_years").to_i
    @principal = params.fetch("user_pv").to_f


    @pmt = @principal * @mpr * ((1 + @mpr)**(@noy*12))/(((1 + @mpr)**(@noy*12)) -1)

    @apr = (@apr*100).to_s(:percentage).#sprintf("%.4f",@apr*100)
    @principal = @principal.to_s(:currency) #sprintf("%.2f",@principal)
    @pmt = sprintf("%.2f",@pmt)

    render({ :template => "calculation_templates/payment_results.html.erb"})
  end
end

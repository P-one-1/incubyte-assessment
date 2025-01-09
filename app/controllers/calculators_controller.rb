class CalculatorsController < ApplicationController
  def add
    digits = params[:string].scan(/-?\d+/).map(&:to_i).reject { |num| num > 1000 }
    
    if (negative_values = digits.select(&:negative?)).any?
      render json: { error: "negatives not allowed #{negative_values}" }
    else
      render json: { output: digits.sum }
    end
  end
end

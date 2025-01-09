class CalculatorsController < ApplicationController
  def add
    raise "No string passed." if params[:string].nil?
    digits = params[:string].scan(/-?\d+/).map(&:to_i).reject { |num| num > 1000 }
    
    if (negative_values = digits.select(&:negative?)).any?
      raise "negatives not allowed #{negative_values}."
    else
      render json: { output: digits.sum }
    end
  rescue => e
    render json: { error: e.message }
  end
end

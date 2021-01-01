class Admins::HomesController < ApplicationController
  # adominsフォルダのhomes_controller
  def top
    @orders = Order.where(created_at: 0.day.ago.all_day)
  end
  
  def search
  end
  
  private
  
end

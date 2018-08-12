class PlansController < ApplicationController
def index
      @plans = Plan.all
   end
   
   def new
      @plan = Plan.new
   end
   
   def create
      @plan = Plan.new(plan_params)
      
      if @plan.save
         redirect_to plans_path, notice: "Добавлено #{@plan.name}"
      else
         render "new"
      end
      
   end
   
   def destroy
      @plan = Plan.find(params[:id])
      @plan.destroy
      redirect_to plans_path, notice:  "Видалено #{@plan.name}"
   end
   
   private
      def plan_params
      params.require(:plan).permit(:name, :attachment)
   end
end

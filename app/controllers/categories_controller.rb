class CategoriesController < ApplicationController


   def new
    @category = Category.new
   end

  

   def create
    @category = Category.new(category_params)
   
      
    if @category.save 
      flash[:notice] = "Created Category Successfully"
      redirect_to categories_path
    else
      render 'new'
    end
   end

   def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category name updated successfully"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

   def index
    @category = Category.all
   end

  
        private
      
        def category_params
          params.require(:category).permit(:name)
        end
      
        # def require_admin
        #   if !(logged_in? && current_user.admin?)
        #     flash[:alert] = "Only admins can perform that action"
        #     redirect_to categories_path
        #   end
        # end

end
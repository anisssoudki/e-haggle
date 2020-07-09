class CategoriesController < ApplicationController


       def new 
        if params.include?('user_id')
          @category = User.find_by_id(params[:user_id]).category.new
          @category = User.find_by_id(params[:user_id]).category.build
        else

          @category = Category.new
       end
      end

       def create
        @category =  Category.new
        @product_category = ProductCategory.new
        # @product = Product.find_by_id(params[:product_id])
        @product_category.product_id = @product.id
        @product_category.user = current_user 
        @category.id = @product_category.id 
     
       
        if   @category.save 
        
            flash[:notice] = "category has been successfully posted to e-haggle"
             redirect_to user_products_path
        else 
             render 'new'
        end
    end
      
        private
      
        def category_params
          params.require(:category).permit(:name, product_categorie:[:like])
          
        end
      


end
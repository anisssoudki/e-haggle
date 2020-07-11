class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
   
    def show 
    end

    def index 
        @products = Product.paginate(page: params[:page], per_page: 20)
    end

    def new
     @product = Product.new
      
    end

    def edit
    end

    def create
      @product = Product.new(product_params)
      @product.user = current_user
      
        if   @product.save 
         
            flash[:notice] = "Product has been successfully posted to e-haggle"
             redirect_to user_product_path(current_user, @product)
        else 
             render 'new'
        end
      
    end
    
    def update 
       if  @product.update(product_params) 
        flash[:notice] = "Product was updated successfully"
        redirect_to user_product_path(@product) 
       else 
        render 'edit'
       end
    end

    def destroy
        
        @product.destroy
        redirect_to user_products_path
    end


    private



      def product_params
        params.require(:product).permit(:name, :price, :description, :image, :category_ids => [:id, :name] )
      end


      
      def set_product
        @product = Product.find(params[:id])
      end

      def require_same_user
        # if current user is admin we will let him have his way and edit anyones account
        if current_user != @product.user && !current_user.admin?
          flash[:alert] = "You can only edit or delete your own account"
          redirect_to user_product_path(@product)
        end
      end
end
class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]


    def show 
    end

    def index 
        @products = Product.all
    end

    def new
    @product = Product.new
    end

    def edit
    end

    def create
        @product = Product.new(product_params)
        if   @product.save 
            flash[:notice] = "Product has been successfully posted to e-haggle"
             redirect_to user_product_path(@product)
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
        set_product
        @product.destroy
        redirect_to user_products_path
    end


    private

      def product_params
        params.require(:product).permit(:name, :price, :description, :image)
      end

      def set_product
        @product = Product.find(params[:id])
      end

      
end
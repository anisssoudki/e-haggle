class ProductsController < ApplicationController

def index 
@products = Product.all
end

    def show 
        @product = Product.find(params[:id])
        
       
    end

    def new
    @product = Product.new
    end

    def edit
        @product = Product.find(params[:id])
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
        @product = Product.find(params[:id])
       if  @product.update(product_params)
        flash[:notice] = "Product was updated successfully"
        redirect_to user_product_path(@product)
       else 
        render 'edit'
       end
    end

    private
    def product_params
        params.require(:product).permit(:name, :price, :description, :image)
        
      end

end
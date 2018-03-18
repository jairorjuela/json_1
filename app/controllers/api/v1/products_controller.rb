module Api
    module V1
        class ProductsController < ApplicationController
          def index
            @products = Product.all
            render json: @products
          end

          def create
            
        end
    end
end

module Api
    module V1
        class ProductsController < ApplicationController
          skip_before_action :verify_authenticity_token

          def index
            @products = Product.all
            render json: @products
          end

          def new
            @product = Product.new
          end

          def create
            @product = Product.new(product_params)
            if @product.save
              render json: @products, status: 201
            else
              render json: {errors: @product.errors }, status: 422
            end
          end

          def update
            @product = Product.where(id: params[:id]).first

            if @product.update(product_params)
              render json: @products, status: 200
            else
              render json: {errors: @prod.errors }, status: 422
            end
          end

          def destroy
            @product = Product.find(params[:id])
            @product.destroy
            head 204
          end

          private
          def product_params
            params.require(:product).permit(:name, :price)
          end
        end
    end
end

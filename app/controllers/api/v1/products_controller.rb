module Api
    module V1
        class ProductsController < ApplicationController
          skip_before_action :verify_authenticity_token
          before_action :set_product, only: [:show, :edit, :update, :destroy]

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
            if @product.update(product_params)
              render json: @products, status: 200
            else
              render json: {errors: @product.errors }, status: 422
            end
          end

          def destroy
            @product.destroy
            render json: @products, status: 204
          end

          private

          def set_product
            @product = Product.find(params[:id])
          end

          def product_params
            params.require(:product).permit(:name, :price)
          end
        end
    end
end

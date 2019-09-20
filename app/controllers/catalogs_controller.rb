class CatalogsController < ApplicationController
  before_action :set_catalog, only: [:show, :update, :destroy]

  def index
    @catalogs = Catalog.all
    render json: response_data('catalogs', @catalogs), status: :ok
  end
  
  def create
    @catalogs = Catalog.new(catalog_params)
    puts"-------------------#{@catalogs}"
    if  @catalogs.save
      render json: {status: 'SUCECESS', message: 'Catalog saved', data: @catalogs}, status: :ok
    else 
      render json: {status: 'ERROR', message: @catalogs.errors.full_messages}, status: :unprossesable
    end
  end


  def show
    render json: {status: 'SUCECESS', message: 'Catalog loaded', data: @catalog}, status: :ok
  end

  def destroy
    if @catalog.destroy
      render json: {status: 'sucessfully deleted' }, status: :ok
    else 
      render json: {status: 'unable to deleted', message: 'Id not found' }, status: :unprossesable
    end
  end

  def update
    if @catalog.update(catalog_params)
      render json: {status: 'SUCECESS', message: 'Catalog updated', data: @catalog}, status: :ok
    else
      render json: {status: "Error", }
    end
  end

  private
  def catalog_params
    params.require(:catalog).permit(:name, :ctype)
  end
  
  def set_catalog
    @catalog = Catalog.find(params[:id])
  end
end     


class CassettesController < ApplicationController

    http_basic_authenticate_with name: "Tom", password: "1234", except: [:index, :show]

    def index
        @cassettes = Cassette.all
      end

    def show
        @cassette = Cassette.find(params[:id])
      end

def new
    @cassette = Cassette.new
  end
   
  def edit
    @cassette = Cassette.find(params[:id])
  end

  def create
    @cassette = Cassette.new(cassette_params)
   
    if @cassette.save
      redirect_to @cassette
    else
      render 'new'
    end
  end

  def update
    @cassette = Cassette.find(params[:id])
   
    if @cassette.update(cassette_params)
      redirect_to @cassette
    else
      render 'edit'
    end
  end

  def destroy
    @cassette = Cassette.find(params[:id])
    @cassette.destroy
   
    redirect_to cassettes_path
  end

  private
  def cassette_params
    params.require(:cassette).permit(:title, :artist)
  end

  end
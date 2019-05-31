class HanksController < ApplicationController
  before_action :set_hank, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index]
  
  # GET /hanks
  # GET /hanks.json
  def index
    @hanks = Hank.all
    respond_to do |format|
      format.html
      format.csv { send_data @hanks.to_csv(['name', 'cod_anchor', 'cod_dmc', 'cod_maxi']) }
    end

    if params[:search]
        @search_term = params[:search]
          if params[:radio_input] == 'hank_name'
            @hanks = @hanks.search_by_name(@search_term)
          end
          if params[:radio_input] == 'cod_anchor'
            @hanks = @hanks.search_by_cod_anchor(@search_term)
          end
          if params[:radio_input] == 'cod_dmc'
            @hanks = @hanks.search_by_cod_dmc(@search_term)
          end
          if params[:radio_input] == 'cod_maxi'
            @hanks = @hanks.search_by_cod_maxi(@search_term)
          end     
     end
  end

  def import
    Hank.import(params[:file])
    redirect_to root_url, notice: "Informações adicionadas com sucesso!"
  end

  # GET /hanks/1
  # GET /hanks/1.json
  def show
  end

  # GET /hanks/new
  def new
    @hank = Hank.new
  end

  # GET /hanks/1/edit
  def edit
  end

  # POST /hanks
  # POST /hanks.json
  def create
    @hank = Hank.new(hank_params)

    respond_to do |format|
      if @hank.save
        format.html { redirect_to @hank, notice: 'Hank was successfully created.' }
        format.json { render :show, status: :created, location: @hank }
      else
        format.html { render :new }
        format.json { render json: @hank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hanks/1
  # PATCH/PUT /hanks/1.json
  def update
    respond_to do |format|
      if @hank.update(hank_params)
        format.html { redirect_to @hank, notice: 'Hank was successfully updated.' }
        format.json { render :show, status: :ok, location: @hank }
      else
        format.html { render :edit }
        format.json { render json: @hank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hanks/1
  # DELETE /hanks/1.json
  def destroy
    @hank.destroy
    respond_to do |format|
      format.html { redirect_to hanks_url, notice: 'Hank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hank
      @hank = Hank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hank_params
      params.require(:hank).permit(:name, :cod_anchor, :cod_dmc, :cod_maxi, :image)
    end

 
end

class DemandsController < ApplicationController

  before_filter :check

  # GET /demands
  # GET /demands.json
  def index

    if session[:user].tipo == 3
      @demands = Demand.all
    else
      @demands = Demand.where(:user_id => session[:user].id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @demands }
    end
  end


# GET /demands/1
# GET /demands/1.json
def show
  @demand = Demand.find(params[:id])

  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @demand }
  end
end

# GET /demands/new
# GET /demands/new.json
def new
  @demand = Demand.new

  respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @demand }
  end
end

# GET /demands/1/edit
def edit
  @demand = Demand.find(params[:id])
end

# POST /demands
# POST /demands.json
def create
  @demand = Demand.new(params[:demand])
  @demand.user_id = session[:user].id
  @demand.estado = 'pendiente'
  respond_to do |format|
    if @demand.save
      format.html { redirect_to @demand, notice: 'La demanda fue creada exitosamente' }
      format.json { render json: @demand, status: :created, location: @demand }
    else
      format.html { render action: "new" }
      format.json { render json: @demand.errors, status: :unprocessable_entity }
    end
  end
end

# PUT /demands/1
# PUT /demands/1.json
def update
  @demand = Demand.find(params[:id])

  respond_to do |format|
    if @demand.update_attributes(params[:demand])
      format.html { redirect_to @demand, notice: 'La demanda fue modificado exitosamente' }
      format.json { head :no_content }
    else
      format.html { render action: "edit" }
      format.json { render json: @demand.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /demands/1
# DELETE /demands/1.json
def destroy
  @demand = Demand.find(params[:id])
  @demand.destroy

  respond_to do |format|
    format.html { redirect_to demands_url }
    format.json { head :no_content }
  end
end

def aprobar
  d = Demand.find(params[:id])
  respond_to do |format|
    if(params[:opcion] == '1')
      d.update_attribute(:estado, 'aprobado')
      format.html { redirect_to demands_url}
    else
      d.update_attribute(:estado, 'desaprobado')
      format.html { redirect_to demands_url }
    end
  end
end

private

def check
  if not session[:user].nil? and session[:user].tipo!=1
  true
  else
   respond_to do |format|
      format.html { render :inline => "NO", :status =>"404" }
      format.json { render json: @sessions}
   end
  end
end
end


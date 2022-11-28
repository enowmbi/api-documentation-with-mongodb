class EndPointsController < ApplicationController
  before_action :set_end_point, only: %i[show edit update destroy]

  # GET /end_points or /end_points.json
  def index
    @resource = Resource.find(params[:resource_id])
    @end_points = @resource.end_points
  end

  # GET /end_points/1 or /end_points/1.json
  def show; end

  # GET /end_points/new
  def new
    @resource = Resource.find(params[:resource_id])
    @end_point = EndPoint.new
  end

  # GET /end_points/1/edit
  def edit; end

  # POST /end_points or /end_points.json
  def create
    @resource = Resource.find(params[:resource_id])
    @end_point = @resource.end_points.build(end_point_params)

    respond_to do |format|
      if @end_point.save
        format.html { redirect_to resource_end_point_url(@resource, @end_point), notice: "End point was successfully created." }
        format.json { render :show, status: :created, location: @end_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @end_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /end_points/1 or /end_points/1.json
  def update
    respond_to do |format|
      if @end_point.update(end_point_params)
        format.html { redirect_to end_point_url(@resource, @end_point), notice: "End point was successfully updated." }
        format.json { render :show, status: :ok, location: @end_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @end_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /end_points/1 or /end_points/1.json
  def destroy
    @end_point.destroy

    respond_to do |format|
      format.html { redirect_to end_points_url, notice: "End point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_end_point
      @resource = Resource.find(params[:resource_id])
      @end_point = @resource.end_points.where({ _id: params[:id] }).first
    end

    # Only allow a list of trusted parameters through.
    def end_point_params
      params.require(:end_point).permit(:name, :description, :http_method)
    end
end

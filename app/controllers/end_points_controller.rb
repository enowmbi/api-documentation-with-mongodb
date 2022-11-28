class EndPointsController < ApplicationController
  before_action :set_end_point, only: %i[edit update destroy]

  # GET /end_points or /end_points.json
  def index
    @resource = Resource.find(params[:id])
    @end_points = @resource.end_points
  end

  # GET /end_points/1 or /end_points/1.json
  def show
    end_point = Resource.collection.aggregate([
      {"$unwind": "$end_points"},
      {"$match": {"end_points._id": BSON::ObjectId(params[:id])}},
      {"$replaceRoot": {"newRoot": "$end_points"}}
    ]).first
    @query_parameters = end_point[:query_parameters]
    @end_point = EndPoint.new({id: end_point[:_id], name: end_point[:name], description: end_point[:description], http_method: end_point[:http_method]})
    @resource = Resource.find(session[:resource]["$oid"])
  end

  # GET /end_points/new
  def new
    @end_point = EndPoint.new
  end

  # GET /end_points/1/edit
  def edit
  end

  # POST /end_points or /end_points.json
  def create
    @resource = Resource.find(params[:id])
    session[:resource] = @resource._id
    @end_point = @resource.end_points.build(end_point_params)

    respond_to do |format|
      if @end_point.save
        format.html { redirect_to end_point_url(session[:resource], @end_point), notice: "End point was successfully created." }
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
      @end_point = EndPoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def end_point_params
      params.require(:end_point).permit(:name, :description, :http_method)
    end
end

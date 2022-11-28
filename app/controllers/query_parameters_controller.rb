class QueryParametersController < ApplicationController
  def create
    resource = Resource.find(params[:resource_id])
    end_point = resource.end_points.where({ _id: params[:end_point_id] }).first
    end_point.query_parameters.build(query_parameter_params)

    respond_to do |format|
      if end_point.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("query-parameter-form", partial: "query_parameters/form", locals: { resource: resource, end_point: end_point, query_parameter: QueryParameter.new}),
            turbo_stream.prepend("query-parameters", partial: "query_parameters/query_parameter", locals: { query_parameter: resource.end_points.find(end_point.id).query_parameters.last }),
            turbo_stream.update("notice", html: "Query Parameter was created successfully")
          ]
        end
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("query-parameter-form", partial: "query_parameters/form", locals: { query_parameter: @query_parameter }),
            turbo_stream.update("alert", html: @query_parameter.errors.full_messages)
          ]
        end
      end
    end
  end

  def update
  end

  def destroy
  end

  private

  def query_parameter_params
    {
      name: params[:name],
      description: params[:description],
      default: params[:default],
      type: params[:type],
      optional: params[:optional],
      valid_values: params[:valid_values]
    }
  end
end

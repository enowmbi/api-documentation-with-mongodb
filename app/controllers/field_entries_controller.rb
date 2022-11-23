class FieldEntriesController < ApplicationController
  def create
    @resource = Resource.find(params[:id])
    @resource.field_entries.build(field_entry_params)
    respond_to do |format|
      if @resource.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new-field-entry-form", partial: "field_entries/form", locals: { field_entry: FieldEntry.new }),
            turbo_stream.prepend("field-entries", partial: "field_entries/field_entry", locals: { field_entry: @resource.field_entries.last }),
            turbo_stream.update("notice", html: "Field Entry was created successfully")
          ]
        end
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("new-field-entry-form", partial: "field_entries/form", locals: { field_entry: @field_entry }),
            turbo_stream.update("alert", html: @field_entry.errors.full_message)
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

  def field_entry_params
    params.require(:field_entry).permit(:name, :description, :default, :type)
  end
end

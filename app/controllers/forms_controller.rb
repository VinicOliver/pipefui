# frozen_string_literal: true

class FormsController < ApplicationController
  before_action :set_form, only: %i[edit update destroy]

  def index
    @forms = Form.all
  end

  def new
    @form = Form.new
    @form.fields.build
  end

  def edit; end

  def create
    @form = Form.new(form_params)

    if @form.save
      redirect_to root_url
    else
      redirect_to new_form_url
    end
  end

  def update
    if @form.update(form_params)
      redirect_to root_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @form.destroy

    redirect_to root_url
  end

  private

  def set_form
    @form = Form.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Form not found'
    redirect_to root_url
  end

  def form_params
    params.require(:form).permit(:title, fields_attributes: %i[id data_type label required _destroy])
  end
end

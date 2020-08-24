class Api::V1::GroupOrganizationsController < ApplicationController
  before_action :group_oranization, only: %i[locations model_type_prices]

  def organizations
    organizations = Organization.where(group_organization_id: params[:group_organization_ids])
    render json: organizations
  end

  def locations
    locations = group_oranization.locations
    render json: locations.map(&:name)
  end

  def model_type_prices
    model_type_prices = group_oranization.model_type_prices(params)
    render json: model_type_prices
  end

  private

  def group_oranization
    @group_oranization ||= GroupOrganization.find(params[:group_organization_id])
  end
end

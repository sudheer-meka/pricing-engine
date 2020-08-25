require 'rails_helper'

RSpec.describe Api::V1::GroupOrganizationsController, type: :controller do
  describe 'GET #organizations' do
    let(:organization) { create(:organization) }

    it 'returns a success response' do
      get :organizations, params: { group_organization_ids: [organization.group_organization.id] }

      expect(response).to be_successful
    end

    it 'returns organization ids' do
      get :organizations, params: { group_organization_ids: [organization.group_organization.id] }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body[0]['id']).to eq organization.id
    end

    it 'returns organization names' do
      get :organizations, params: { group_organization_ids: [organization.group_organization.id] }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body[0]['name']).to eq organization.name
    end
  end

  describe 'GET #locations' do
    let(:location) { create(:location) }

    it 'returns a success response' do
      get :locations, params: { group_organization_id: location.organization.group_organization.id }

      expect(response).to be_successful
    end

    it 'returns location names' do
      get :locations, params: { group_organization_id: location.organization.group_organization.id }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body[0]).to eq location.name
    end
  end

  describe 'GET #model_type_prices' do
    let(:group_organization) { create(:group_organization) }

    it 'returns a success response' do
      get :model_type_prices, params: { group_organization_id: group_organization.id }

      expect(response).to be_successful
    end
  end
end

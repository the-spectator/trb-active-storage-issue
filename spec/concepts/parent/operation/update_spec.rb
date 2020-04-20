# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Parent::Operation::Update do
  let(:parent) { create(:parent, children: create_list(:child, 1)) }
  let(:params) {
    {
      id: parent.id,
      parent: {
        id: parent.id,
        name: parent.name,
        date_of_birth: parent.date_of_birth,
        gender: parent.gender,
        children: [
          {**attributes_for(:child, parent_id: parent.id)}
        ]
      }
    }.with_indifferent_access
   }

  it "should pass" do
    result = described_class.(params: params)
    expect(result.success?).to be(true)
  end
end

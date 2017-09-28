require 'spec_helper'
require_relative '../../../../apps/web/controllers/dashboard/dashboard'

describe Web::Controllers::Dashboard::Dashboard do
  let(:action) { Web::Controllers::Dashboard::Dashboard.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end

require 'spec_helper'
require_relative '../../../../apps/api/controllers/weos/list'

describe Api::Controllers::Weos::List do
  let(:action) { Api::Controllers::Weos::List.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end

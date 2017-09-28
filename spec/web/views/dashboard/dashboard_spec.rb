require 'spec_helper'
require_relative '../../../../apps/web/views/dashboard/dashboard'

describe Web::Views::Dashboard::Dashboard do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/dashboard/dashboard.html.erb') }
  let(:view)      { Web::Views::Dashboard::Dashboard.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    skip 'This is an auto-generated test. Edit it and add your own tests.'

    # Example
    view.foo.must_equal exposures.fetch(:foo)
  end
end

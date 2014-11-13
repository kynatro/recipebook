require 'rails_helper'

RSpec.describe "Application routing", type: :routing do
  it { expect(get(root_url(only_path: true))).to route_to(controller: "recipes", action: "index") }
end

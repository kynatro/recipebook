require 'rails_helper'

RSpec.describe "RecipesController routing", type: :routing do
  it { expect(get("/recipes")).to route_to(controller: "recipes", action: "index") }
  it { expect(get("/recipes/1")).to route_to(controller: "recipes", action: "show", id: "1") }
  it { expect(get("/recipes/1/edit")).to route_to(controller: "recipes", action: "edit", id: "1") }
  it { expect(post("/recipes")).to route_to(controller: "recipes", action: "create") }
  it { expect(delete("/recipes/1")).to route_to(controller: "recipes", action: "destroy", id: "1") }
  it { expect(put("/recipes/1")).to route_to(controller: "recipes", action: "update", id: "1") }
end

require 'rails_helper'

RSpec.describe "Alunos", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/alunos/index"
      expect(response).to have_http_status(:success)
    end
  end

end

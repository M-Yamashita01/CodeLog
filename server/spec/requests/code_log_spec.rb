require 'rails_helper'
require 'json'

RSpec.describe "CodeLogs", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe "#get_git_log" do
    subject { post code_log_get_git_log_path, params: params }

    context '正常系' do
      let(:params) {
        {
          file_path: 'foo/bar/hoge.rb',
          method_name: 'test_method',
          select_repository_name: 'repository_name',
        }
      }

      it 'ステータス200が返されること' do
        subject
        expect(response).to have_http_status(:ok)
        response_body = JSON.parse(response.body)
        expect(response_body['message']).to eq 'test'
      end
    end
  end
end

require 'rails_helper'
require 'json'
require 'open3'
require 'fileutils'

RSpec.describe "CodeLogs", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe '#home' do
    subject { get code_log_home_path }

    context '正常系' do
      let(:repository_path) { "#{Rails.root}/repository/hoge/foo" }

      before do
        FileUtils.mkdir_p(repository_path)
      end

      it 'ステータス200が返されること' do
        subject
        expect(response).to have_http_status(:ok)
        repository_list = controller.instance_variable_get('@repository_list')
        expect(repository_list).to eq [repository_path]
      end
    end

    after do
      root_path = Rails.root
      FileUtils.rm_r("#{root_path}/repository")
    end
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

      before do
        allow(Open3).to receive(:capture3).and_return('hoge', 'foo', 'bar')
      end

      it 'ステータス200が返されること' do
        subject
        expect(response).to have_http_status(:ok)
        response_body = JSON.parse(response.body)
        expect(response_body['message']).to eq 'hoge'
      end
    end
  end
end

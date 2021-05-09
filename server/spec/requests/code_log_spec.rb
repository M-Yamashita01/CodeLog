require 'rails_helper'

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

      it 'test' do

        subject
        expect('test').to eq 'test'
      end
    end
  end
end

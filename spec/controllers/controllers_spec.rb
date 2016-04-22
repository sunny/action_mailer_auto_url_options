require 'spec_helper'

describe "Controllers", type: :controller do
  let(:options) { ActionMailer::Base.default_url_options }

  controller do
    def index
      render text: "OK"
    end
  end

  before do
    @routes.draw do
      get 'index' => 'anonymous#index'
    end
  end

  it "sets the host" do
    request.host = "fr.example.com:8080"
    get :index

    expect(options[:host]).to eq("fr.example.com:8080")
  end

  it "sets the protocol" do
    request.env["HTTPS"] = "on"

    get :index

    expect(options[:protocol]).to eq("https://")
  end
end

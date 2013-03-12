require 'vcr'
require 'faraday'
require_relative 'support/vcr'
require_relative '../lib/apsis.rb'


unless ENV['APSIS_API_KEY'] && ENV['APSIS_TEST_MAILING_LIST']
  warn ["WARNING: You need to set the APSIS_API_KEY and APSIS_TEST_MAILING_LIST",
    "environment variables or the calls to the APSIS API will be invalid."].join("\n")
end

describe "Apsis" do
  it "adds a subscriber to a list" do
    VCR.use_cassette('add_subscriber') do
      api_key = ENV['APSIS_API_KEY']
      mailing_list = ENV['APSIS_TEST_MAILING_LIST']
      apsis = Apsis.new(api_key)
      response = apsis.create_subscribers(mailing_list, [
        { 'Email' => 'johndoe@example.com', 'Name' => 'John Doe' },
        { 'Email' => 'janedoe@example.com', 'Name' => 'Jane Doe' }
      ])
      response['Code'].should eql 1
    end
  end

  it "raises an exception when an error HTTP status code is returned" do
    VCR.use_cassette('raise_exception') do
      api_key = ENV['APSIS_API_KEY']
      mailing_list = 'thisisnogood'
      apsis = Apsis.new(api_key)
      lambda {
        apsis.create_subscribers(mailing_list, [
        { 'Email' => 'johndoe@example.com', 'Name' => 'John Doe' },
        { 'Email' => 'janedoe@example.com', 'Name' => 'Jane Doe' }
      ])}.should raise_error(Apsis::ApsisError)
    end
  end
end

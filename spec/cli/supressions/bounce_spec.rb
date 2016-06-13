# encoding: utf-8
require File.dirname(__FILE__) + '/../../spec_helper'

module SendGrid4r::CLI::Supressions
  describe Bounce do
    describe 'integration test', :it do
      before do
        Dotenv.load
      end

      it '#list' do
        args = [
          'list',
          '--apikey', ENV['SILVER_API_KEY'],
          '--start_time', Time.local(2016, 1, 1).to_i,
          '--end_time', Time.local(2016, 1, 31).to_i
        ]
        Bounce.start(args)
      end

      it '#delete with delete_all' do
        args = [
          'delete',
          '--apikey', ENV['SILVER_API_KEY'],
          '--delete_all', true
        ]
        Bounce.start(args)
      end

      it '#delete with email' do
        args = [
          'delete',
          '--apikey', ENV['SILVER_API_KEY'],
          '--email', ''
        ]
        Bounce.start(args)
      end

      it '#delete with emails' do
        args = [
          'delete',
          '--apikey', ENV['SILVER_API_KEY'],
          '--emails', 'abc@abc.com', 'cde@cde.com'
        ]
        Bounce.start(args)
      end

      it '#get' do
        args = [
          'get',
          '--apikey', ENV['SILVER_API_KEY'],
          '--email', ''
        ]
        Bounce.start(args)
      end
    end
  end
end

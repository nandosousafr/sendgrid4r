# encoding: utf-8
require File.dirname(__FILE__) + '/../../spec_helper'

module SendGrid4r::CLI::Supressions
  describe GroupUnsubscribe do
    describe 'integration test', :it do
      before do
        Dotenv.load
      end

      it '#add' do
        args = [
          'add',
          '--apikey', ENV['SILVER_API_KEY'],
          '--group_id', 889,
          '--emails', 'abc@abc.com', 'cde@cde.com'
        ]
        GroupUnsubscribe.start(args)
      end

      it '#list with no params' do
        args = [
          'list',
          '--apikey', ENV['SILVER_API_KEY'],
          '--group_id', 889
        ]
        GroupUnsubscribe.start(args)
      end

      it '#remove' do
        args = [
          'remove',
          '--apikey', ENV['SILVER_API_KEY'],
          '--group_id', 889,
          '--email', 'abc@abc.com'
        ]
        GroupUnsubscribe.start(args)
      end
    end
  end
end

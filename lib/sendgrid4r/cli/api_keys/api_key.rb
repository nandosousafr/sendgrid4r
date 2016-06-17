module SendGrid4r::CLI
  module ApiKeys
    #
    # SendGrid Web API v3 ApiKeys ApiKey
    #
    class ApiKey < SgThor
      desc 'list', 'List API keys'
      def list
        puts @client.get_api_keys
      rescue RestClient::ExceptionWithResponse => e
        puts e.inspect
      end

      desc 'create', 'Create an API key'
      option :name, require: true
      option :scopes, type: :array
      def create
        puts @client.post_api_key(parameterise(options))
      rescue RestClient::ExceptionWithResponse => e
        puts e.inspect
      end

      desc 'get', 'Get an API key'
      option :api_key_id, require: true
      def get
        puts @client.get_api_key(parameterise(options))
      rescue RestClient::ExceptionWithResponse => e
        puts e.inspect
      end

      desc 'delete', 'Delete an API key'
      option :api_key_id, require: true
      def delete
        puts @client.delete_api_key(parameterise(options))
      rescue RestClient::ExceptionWithResponse => e
        puts e.inspect
      end

      desc 'update', 'Update an API key'
      option :api_key_id, require: true
      option :name, require: true
      option :scopes, type: :array
      def update
        puts @client.put_api_key(parameterise(options))
      rescue RestClient::ExceptionWithResponse => e
        puts e.inspect
      end

      desc('permission SUBCOMMAND ...ARGS', 'Manage permission for API key')
      subcommand('permission', Permission)
    end
  end
end

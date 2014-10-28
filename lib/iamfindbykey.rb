require 'fog'
require "iamfindbykey/version"

module EverTools
  class IamFindByKey

    def initialize(args)
      @args = args
      @key = args[0]
    end

    def run
      display('ID', user.id)
      display('Path', user.path)
      display('ARN', user.arn)
      display('Created', user.created_at)
    end

    private

    def display(key, value)
      puts "#{key}: #{value}"
    end

    def keymap
      @keymap ||= begin
        connection.users.reduce({}) do |m, user|
          connection.list_access_keys('UserName' => user)
            .body['AccessKeys']
            .map { |ak| ak['AccessKeyId'] }
            .each { |ak| m[ak] = user }
        end
      end
    end

    def user
      @user ||= begin
        unless keymap[@key]
          puts "Key #{@key} not found"
          exit 1
        end
        connection.users.get(keymap[@key])
      end
    end

    def connection
      @connection ||= Fog::AWS::IAM.new
    end
  end
end

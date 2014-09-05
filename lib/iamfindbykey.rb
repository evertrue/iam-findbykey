require 'fog'
require "iamfindbykey/version"

module EverTools
  class IamFindByKey

    def initialize(args)
      @args = args
      @key = args[1]
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

    def user
      @user ||= connection.users.find { |u| u.user_id == @key }
    end

    def connection
      @connection ||= Fog::AWS::IAM.new
    end
  end
end

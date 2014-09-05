require 'fog'
require "iamfindbykey/version"

module EverTools
  class IamFindByKey

    def initalize(args)
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

    def user
      c.users.find { |u| u.user_id == @key }
    end

    def connection
      @connection ||= Fog::AWS::IAM.new
    end
  end
end

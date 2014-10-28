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

    def user
      @user ||= begin
        r = connection.users.find do |user|
          # puts "Checking user #{user.id}"
          connection.list_access_keys('UserName' => user.id)
            .body['AccessKeys']
            .map { |ak| ak['AccessKeyId'] }.include?(@key)
        end
        if r.nil?
          puts "Key #{@key} not found"
          exit 1
        end
        r
      end
    rescue Fog::AWS::IAM::ValidationError => e
      puts "Error processing user: #{user}"
      raise e
    end

    def connection
      @connection ||= Fog::AWS::IAM.new
    end
  end
end

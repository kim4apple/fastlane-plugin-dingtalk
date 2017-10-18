require 'dingbot'

module Fastlane
  module Actions
    class DingtalkAction < Action
      def self.run(params)
        UI.message("The dingtalk plugin is working!")

        access_token = params[:access_token]

        title = params[:title]
        message = params[:message]
        moreTitle = params[:moreTitle]
        moreURL = params[:moreURL]

        DingBot.endpoint='https://oapi.dingtalk.com/robot/send'
        DingBot.access_token = access_token


        # 发送整体跳转ActionCard消息
        message = DingBot::Message::WholeActionCard.new(
            title,
            message,
            moreTitle,
            moreURL
        )

        DingBot.send_msg(message)
      end

      def self.description
        "a fastlane plugin for dingtalk."
      end

      def self.authors
        ["Kim Huang"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "a fastlane plugin for dingtalk."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :access_token,
                                  env_name: "DINGTALK_ACCESS_TOKEN",
                               description: "Access token for ding talk",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :message,
                                  env_name: "DINGTALK_MESSAGE",
                               description: "Message",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end

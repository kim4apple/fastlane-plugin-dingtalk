require 'dingbot'

module Fastlane
  module Actions
    class DingtalkAction < Action
      def self.run(params)
        UI.message("The dingtalk plugin is working!")

        access_token = params[:access_token]

        title = params[:title]
        message = params[:message]
        more_title = params[:more_title]
        more_url = params[:more_url]
        is_at_all = params[:is_at_all]

        DingBot.endpoint = 'https://oapi.dingtalk.com/robot/send'
        DingBot.access_token = access_token

        # Send ActionCard message
        message = DingBot::Message::WholeActionCard.new(title, message, more_title, more_url)
        message.isAtAll = is_at_all

        DingBot.send_msg(message)

        UI.success "Message send success."
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
                             default_value: "",
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :title,
                                  env_name: "DINGTALK_TITLE",
                               description: "Title",
                                  optional: false,
                             default_value: "",
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :message,
                                  env_name: "DINGTALK_MESSAGE",
                               description: "Message",
                                  optional: false,
                             default_value: "",
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :more_title,
                                  env_name: "DINGTALK_MORE_TITLE",
                               description: "More title",
                                  optional: false,
                             default_value: "",
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :more_url,
                                  env_name: "DINGTALK_MORE_URL",
                               description: "More URL",
                                  optional: false,
                             default_value: "",
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :is_at_all,
                                  env_name: "DINGTALK_IS_AT_ALL",
                               description: "Is at all",
                                  optional: true,
                             default_value: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end

module Fastlane
  module Helper
    class DingtalkHelper
      # class methods that you define here become available in your action
      # as `Helper::DingtalkHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the dingtalk plugin helper!")
      end
    end
  end
end

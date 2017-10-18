describe Fastlane::Actions::DingtalkAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The dingtalk plugin is working!")
      access_token = 'access_token'

      title = 'title'
      message = 'message'
      more_title = 'more'
      more_url = 'https://www.google.com'

      Fastlane::Actions::DingtalkAction.run(access_token: access_token,
                                                   title: title,
                                                 message: message,
                                              more_title: more_title,
                                                more_url: more_url)
    end
  end
end

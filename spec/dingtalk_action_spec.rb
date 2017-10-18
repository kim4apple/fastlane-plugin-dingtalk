describe Fastlane::Actions::DingtalkAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The dingtalk plugin is working!")
    end
  end
end

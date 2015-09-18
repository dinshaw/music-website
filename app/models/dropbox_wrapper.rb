require 'dropbox_sdk'
class DropboxWrapper
  def covers
    @covers ||= client.metadata('Music/Covers/Lyrics')['contents'].map do |doc|
      doc['path'].split('/').last.split('.').first
    end
  end

  private
  def client
    @client ||= DropboxClient.new ENV['dropbox_auth_token']
  end
end

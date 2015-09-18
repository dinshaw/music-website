class AwsWrapper
  def tracks
    bucket.objects(prefix: 'pre-production-tracks').reject do |obj|
      obj.key == 'pre-production-tracks/'
    end.map do |obj|
      {
        name: obj.key.gsub(/pre-production-tracks\//,'').gsub('-', ' ').split('.').first.titleize,
        url: obj.public_url
      }
    end
  end

  def demos
    bucket.objects(prefix: 'demos').reject do |obj|
      obj.key == 'demos/'
    end.map do |obj|
      {
        name: obj.key.gsub(/demos\//,'').gsub('-', ' ').split('.').first.titleize,
        url: obj.public_url
      }
    end
  end

  private

  def bucket
    @bucket ||= client.bucket('thedinman.com')
  end

  def client
    @client ||= Aws::S3::Resource.new
  end
end

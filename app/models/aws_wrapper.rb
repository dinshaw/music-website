class AwsWrapper
  def tracks
    bucket.objects(prefix: 'pre-production-tracks').reject do |obj|
      obj.key == 'pre-production-tracks/'
    end
  end

  def demos
    bucket.objects(prefix: 'demos').reject do |obj|
      obj.key == 'demos/'
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

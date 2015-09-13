class AwsWrapper
  def tracks
    bucket.objects.reject do |obj|
      obj.key == 'pre-production-tracks/'
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

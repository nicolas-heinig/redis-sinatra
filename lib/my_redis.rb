class MyRedis
  URL = Sinatra::Base.production? ? ENV['REDIS_URL'] : 'redis://localhost:6379'

  class << self
    def lrange(*args)
      instance.lrange(*args)
    end

    def rpush(*args)
      instance.rpush(*args)
    end

    private

    def instance
      @instance ||= Redis.new(id: 'sinatra_app', url: URL)
    end
  end
end

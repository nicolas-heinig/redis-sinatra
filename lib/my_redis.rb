class MyRedis
  class << self
    def lrange(*args)
      instance.lrange(*args)
    end

    def rpush(*args)
      instance.rpush(*args)
    end

    private

    def instance
      @instance ||= Redis.new(id: 'sinatra_app')
    end
  end
end

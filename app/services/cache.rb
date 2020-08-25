class Cache
  cattr_accessor :cached_data

  @@cached_data = {}

  def self.get(key)
    return cached_data[key][:value] if cached_data.has_key?(key) && !expired?(key)

    set(key, yield) if block_given?
  end

  def self.set(key, value)
    cached_data[key] = {
      value: value,
      time: Time.now + cache_time
    }
    value
  end

  def self.expired?(key)
    cached_data.dig(key, :time) < Time.now 
  end

  def self.clear
    @@cached_data = {}
  end

  def self.cache_time
    ENV['cache_time'] || 900
  end
end
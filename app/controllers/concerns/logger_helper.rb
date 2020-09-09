module LoggerHelper
  def build_log
    file = env['api.endpoint'].source.source_location[0]
    line = env['api.endpoint'].source.source_location[1]
    logger.info "[api] #{file}:#{line}"
  end
end

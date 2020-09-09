module DataBuildHelper
  def data!(data)
    meta = {}

    if data.is_a?(String)
      meta[:message] = data
      data           = nil
    elsif data.is_a?(Hash)
      meta[:message] = '操作成功'
    end

    { meta: meta, data: data }
  end
end

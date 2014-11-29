# -*- encoding : utf-8 -*-
module ResponseHelper
  # If no accept header is supplied, default response is JSON
  def json_response
    JSON.parse(response.body)
  end
end

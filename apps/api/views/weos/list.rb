module Api::Views::Weos
  class List
    include Api::View
    layout false

    def render
      _raw JSON.dump(weos.map{|weo| weo.to_h })
    end
  end
end

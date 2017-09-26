module Api::Controllers::Weos
  class List
    include Api::Action
    accept :json
    expose :weos

    def call(params)
      @weos = WeoRepository.new.list_by_iso(iso: 'JPN')
    end
  end
end

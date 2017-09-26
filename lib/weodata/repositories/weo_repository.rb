class WeoRepository < Hanami::Repository
  def bulk_insert(data)
    command(:create, :weos, use: [:timestamps], result: :many).call(data)
  end
end

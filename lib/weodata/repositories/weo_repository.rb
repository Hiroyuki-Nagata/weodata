class WeoRepository < Hanami::Repository
  def bulk_insert(data)
    command(:create, :weos, use: [:timestamps], result: :many).call(data)
  end
  def list_by_iso(iso: 'JPN')
    weos
      .where(iso: iso)
      .order(:id)
  end
end

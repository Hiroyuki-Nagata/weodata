# hanami-model and ROM.rb

## bulk insert with ROM.rb

* At first, define method like following:

```
class WeoRepository < Hanami::Repository
  def bulk_insert(data)
    command(:create, :weos, use: [:timestamps], result: :many).call(data)
  end
end
```

* Call it

```
WeoRepository.new.bulk_insert(weo_array)
```

## debug with console

* Call hanami console

```
$ jruby -S bundle exec hanami console
pry(main)>
```

* Use it

```
pry(main)> WeoRepository.new.first
```

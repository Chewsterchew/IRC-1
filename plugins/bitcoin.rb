class Bitcoin
  include Cinch::Plugin

  match /bitcoin/, method: :bitcoin
  match /litecoin/, method: :litecoin
  match /zetacoin/, method: :zetacoin

  def litecoin(m)
    grabthatsweetapi = JSON.parse(RestClient.get('https://api.coinmarketcap.com/v1/ticker/litecoin/'))[0]
    m.reply "LiteCoin Conversions: USD: $#{grabthatsweetapi}['price_usd']"
  end

  def zetacoin(m)
    grabthatsweetapi = JSON.parse(RestClient.get('https://api.coinmarketcap.com/v1/ticker/zetacoin/'))[0]
    m.reply "LiteCoin Conversions: USD: $#{grabthatsweetapi}['price_usd']"
  end

  def bitcoin(m)
    grabthatsweetapi = JSON.parse(RestClient.get('https://api.coindesk.com/v1/bpi/currentprice.json'))
    m.reply "Bitcoin Conversions: USD: $#{grabthatsweetapi['bpi']['USD']['rate']}. GBP: £#{grabthatsweetapi['bpi']['GBP']['rate']}. EUR: €#{grabthatsweetapi['bpi']['EUR']['rate']}"
  end
end
